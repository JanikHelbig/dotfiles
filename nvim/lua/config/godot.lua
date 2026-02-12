local is_windows = jit.os == 'Windows'

local root = vim.fs.root(0, 'project.godot')
if root then
    local pipe = is_windows and '\\\\.\\pipe\\godot-server' or root .. '/server.pipe'
    if not vim.tbl_contains(vim.fn.serverlist(), pipe) then
        vim.fn.serverstart(pipe)
    end
end

vim.lsp.enable('gdscript')

