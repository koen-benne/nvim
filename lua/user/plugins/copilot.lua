-- vim.cmd [[
--   imap <silent><script><expr> <C-A> copilot#Accept("\<CR>")
--   let g:copilot_no_tab_map = v:true
-- ]]

local status_ok, copilot = pcall(require, "copilot")
if not status_ok then
  return
end

local status_comment_ok, comment = pcall(require, "comment")

copilot.setup {
  --[[ copilot_node_command = "/home/koen/.asdf/install/nodejs/19.2.0/bin/node", ]]
  suggestion = {
    auto_trigger = true,
  },
}
