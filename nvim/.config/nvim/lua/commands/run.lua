local M = {}

function M.RunCode()
	local filename = vim.fn.expand("%")
	local filetype = vim.bo.filetype
	local cmd

	if filetype == "python" then
		cmd = "python " .. filename
	elseif filetype == "go" then
		cmd = "go run " .. filename
	else
		print("No runner defined for filetype: " .. filetype)
		return
	end

	vim.cmd("vsplit term://" .. cmd)
end

function M.RunGoTest()
	vim.cmd("vsplit term://" .. "go test -v .")
end

return M
