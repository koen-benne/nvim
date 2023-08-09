local status_ok, dap = pcall(require, "dap")
if not status_ok then
  return
end

require('telescope').load_extension('dap')

dap.adapters.php = {
    type = 'executable',
    command = vim.fn.expand("$HOME") .. "/.asdf/installs/nodejs/19.2.0/bin/node",
    args = {os.getenv("HOME") .. "/Documents/builds/vscode-php-debug/out/phpDebug.js"},
}

dap.configurations.php = {
    {
        type = 'php',
        request = 'launch',
        name = 'Listen for xdebug',
        port = '9003',
    },
}

-- require("nvim-dap-virtual-text").setup()
-- require("dapui").setup()

