local status_ok, dap = pcall(require, "dap")
if not status_ok then
  return
end

dap.adapters.php = {
    type = 'executable',
    command = 'nodejs',
    args = {"/opt/vscode-php-debug/out/phpDebug.js"},
}

dap.configurations.php = {
    {
        type = 'php',
        request = 'launch',
        name = 'Listen for xdebug',
        port = '9003',
        log = true,
        serverSourceRoot = '/srv/www/',
        localSourceRoot = '/home/www/VVV/www/',
    },
}

require("nvim-dap-virtual-text").setup()
require("dapui").setup()

