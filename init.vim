call plug#begin('~/.local/share/nvim/plugged')

Plug 'terrortylor/nvim-comment'
Plug 'rebelot/kanagawa.nvim'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': 'TSUpdate' }

call plug#end()

lua << EOF
require('nvim_comment').setup({
  create_mappings = true,
  line_mapping = "<leader>ci",
  operator_mapping = "<leader>ci",
})
require('kanagawa').setup({
  transparent = true,
  dimInactive = true,
})
require('catppuccin')
require('nvim-treesitter').setup({
  auto_install = true
});

-- Buffer navigation shortcuts
for i = 1, 9 do
  vim.api.nvim_set_keymap('n', '<Leader>' .. i, ':' .. i .. 'b<CR>', { noremap = true, silent = true })
end
vim.api.nvim_set_keymap('n', '<Leader>0', ':10b<CR>', { noremap = true, silent = true })
EOF

set incsearch
" this is from chatgpt to try and center view when incsearch jumps
" around instead of having matches jump to line 1... it doesn't seem
" to work quite properly but it kind of works?
" autocmd CmdlineEnter /,\? :set cmdheight=2
" autocmd CmdlineLeave /,\? :set cmdheight=1 | normal! zz
"
" this was a 2nd suggestion it made replacing the above two lines but
" it still doesn't seem to work quite like I want it to with the below.
" autocmd CmdlineLeave /,\? :set cmdheight=1 | redraw | normal! zz
" autocmd CmdlineLeave /,\? :set cmdheight=1 | sleep 10m | redraw | normal! zz
autocmd CmdlineLeave /,\? :set cmdheight=1 | normal! zz
autocmd CmdlineEnter /,\? :autocmd CursorMoved * ++once normal! zz


nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

nnoremap <silent> <leader>ci :lua require('nvim_comment').comment_toggle(vim.fn.line('.'), vim.fn.line('.'))<CR>
colorscheme kanagawa
set nu
set expandtab
set tabstop=2
set shiftwidth=2
set ai
set termguicolors
map <Leader>n :set nu!<CR>
set mouse=
