"================ Plug Plujgins ==================
call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'liuchengxu/space-vim-dark'
Plug 'airblade/vim-gitgutter'
Plug 'ap/vim-css-color'
Plug 'terryma/vim-multiple-cursors'
Plug 'schickling/vim-bufonly'
Plug 'SirVer/ultisnips'
Plug 'jparise/vim-graphql'
Plug 'HendrikPetertje/vimify'

Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = [
  \ 'coc-tsserver'
  \ ]

if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

Plug 'rhysd/vim-clang-format'

call plug#end()
"
"============= Snippets Configuration ==============
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
set runtimepath+=~/.vim/my-snippets/

autocmd BufNewFile,BufRead *.gs set ft=javascript
"============= Plugin Configuration ==============
colorscheme space-vim-dark
let NERDTreeShowHidden=1
let g:NERDTreeWinSize=40

"============= Editor Configuration ==============
:set number
syntax on

set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
:set backspace=indent,eol,start
set incsearch "search incrementally
set hls "highlight matches in search
set foldlevel=99
set foldmethod=indent
set ignorecase

"================ Keybindings ================
map <leader>q :NERDTreeFind<cr>
nmap <F6> :NERDTreeToggle<CR>

noremap <leader>ww :BufOnly<CR>
noremap <leader>cf :noh<CR>
noremap <leader>f :GFiles<CR>
noremap <leader>F :Rg<CR>
noremap <leader>g za<CR>
noremap <leader>b :call CocActionAsync('jumpDefinition')<CR>
noremap <leader><enter> :CocAction<CR>
nmap <leader>r <Plug>(coc-rename)
nmap <leader>rf <Plug>(coc-references)

autocmd FileType c map <buffer> <leader>l :ClangFormat<cr>
autocmd FileType cpp map <buffer> <leader>l :ClangFormat<cr>

"================ Cursor Settings ================
let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

"========== Highlight Cursor Line ===============
set cursorline

:hi CursorLine   cterm=NONE ctermbg=black

:highlight LineNr ctermfg=white "Make line numbers white

command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview', '~/.vim/plugged/fzf.vim/bin/preview.sh {}']}, <bang>0)
