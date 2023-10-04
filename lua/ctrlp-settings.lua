vim.cmd([[ let g:ctrlp_map = '<c-p>' ]])
vim.cmd([[ let g:ctrlp_cmd = 'CtrlP' ]])
vim.cmd([[ let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard'] ]])
