local M = {}

local function get_git_root()
  local handle = io.popen 'git rev-parse --show-toplevel 2>/dev/null'
  if not handle then
    return nil
  end
  local result = handle:read '*l'
  handle:close()
  return result
end

local function get_gitlab_remote()
  local handle = io.popen 'git config --get remote.origin.url'
  if not handle then
    return nil
  end
  local url = handle:read '*l'
  handle:close()

  if not url then
    return nil
  end

  -- Convert SSH → HTTPS
  url = url:gsub('^ssh://git@', 'https://')
  url = url:gsub(':%d+', '')
  url = url:gsub('%.git$', '')

  return url
end

function M.open_file()
  local git_root = get_git_root()
  if not git_root then
    vim.notify('Not a git repository', vim.log.levels.ERROR)
    return
  end

  local remote = get_gitlab_remote()
  if not remote then
    vim.notify('No GitLab remote found', vim.log.levels.ERROR)
    return
  end

  local file = vim.fn.expand '%:p'
  local rel_path = string.sub(file, #git_root + 2)
  local branch = vim.fn.system('git branch --show-current'):gsub('%s+', '')

  local line = vim.fn.line '.'
  local url = string.format('%s/-/blob/%s/%s#L%d', remote, branch, rel_path, line)
  vim.notify(url)
  vim.fn.setreg('+', url)
  vim.fn.system { 'open', url }
end

function M.open_repo()
  local remote = get_gitlab_remote()
  if not remote then
    vim.notify('No GitLab remote found', vim.log.levels.ERROR)
    return
  end

  vim.fn.system { 'open', remote }
end
return M
