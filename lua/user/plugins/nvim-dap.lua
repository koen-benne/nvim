local status_ok, dap = pcall(require, "dap")
if not status_ok then
  return
end

require('telescope').load_extension('dap')

dap.adapters.php = {
    type = 'executable',
    -- command = vim.fn.expand("$HOME") .. "/.asdf/installs/nodejs/19.2.0/bin/node",
    command = "bash",
    args = {os.getenv("HOME") .. "/.local/share/nvim/mason/bin/php-debug-adapter"},
}
dap.adapters.chrome = {
    type = 'executable',
    -- command = vim.fn.expand("$HOME") .. "/.asdf/installs/nodejs/19.2.0/bin/node",
    command = "bash",
    args = {os.getenv("HOME") .. "/.local/share/nvim/mason/bin/chrome-debug-adapter"},
}

dap.configurations.php = {
    {
        type = 'php',
        request = 'launch',
        name = 'Listen for xdebug',
        port = '9003',
    },
}
dap.configurations.typescriptreact = {
    {
        name = "Debug (Attach) - Remote",
        type = 'chrome',
        request = 'attach',
        -- program = "${file}",
        -- cwd = vim.fn.getcwd(),
        sourceMaps = true,
        -- reAttach = true,
        -- protocol = "inspector",
        -- hostName = "127.0.0.1"
        port = 9222,
        webRoot = "${workspaceFolder}"
    },
}

require("nvim-dap-virtual-text").setup()
require("dapui").setup()

