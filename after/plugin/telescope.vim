"" show all available Telescope pickers
nnoremap <Leader>t <Cmd>Telescope builtin<CR>

"" git-specific pickers
nnoremap <Leader>gb <Cmd>Telescope git_branches<CR>
nnoremap <Leader>gc <Cmd>Telescope git_commits<CR>
nnoremap <Leader>gf <Cmd>Telescope git_files<CR>

"" (gm = "git modifications"... gs and gS are already taken)
nnoremap <Leader>gm <Cmd>Telescope git_status<CR>

"" stuff I want easy access to
nnoremap <Leader><Leader> <Cmd>Telescope commands<CR>
nnoremap <Leader>gr <Cmd>Telescope live_grep<CR>
nnoremap <Leader>f <Cmd>Telescope find_files<CR>
nnoremap <Leader>b <Cmd>Telescope buffers<CR>
nnoremap <Leader>h <Cmd>Telescope help_tags<CR>
nnoremap <Leader>m <Cmd>Telescope keymaps<CR>
nnoremap <Leader>o <Cmd>Telescope oldfiles<CR>
nnoremap <Leader>v <Cmd>Telescope scriptnames<CR>

"" lsp specific stuff
nnoremap <Leader>s <Cmd>Telescope lsp_document_symbols<CR>
nnoremap <Leader>S <Cmd>Telescope lsp_workspace_symbols<CR>
