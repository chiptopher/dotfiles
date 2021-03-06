"================ Plug Plujgins ==================
call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'natebosch/vim-lsc'
Plug 'vim-test/vim-test'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'preservim/nerdtree'
Plug 'mattn/vim-lsp-settings'
Plug 'prettier/vim-prettier'
Plug 'Shougo/deoplete.nvim'
Plug 'lighttiger2505/deoplete-vim-lsp'
Plug 'liuchengxu/space-vim-dark'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'ap/vim-css-color'
Plug 'terryma/vim-multiple-cursors'
Plug 'schickling/vim-bufonly'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'jparise/vim-graphql'
Plug 'w0rp/ale'

call plug#end()
"
"============= Snippets Configuration ==============
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
set runtimepath+=~/.vim/my-snippets/

autocmd BufNewFile,BufRead *.gs set ft=javascript
"============= Plugin Configuration ==============
let test#java#runner = 'gradletest' "Configure vim-test to use gralde for java testing
colorscheme space-vim-dark
let NERDTreeShowHidden=1
let g:NERDTreeWinSize=40
let g:pymode_rope_autoimport=1 "Enable rope commands from python-mode
highlight link JavaIdentifier NONE

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
set ignorecase

"================ Keybindings ================
map <leader>q :NERDTreeFind<cr>
nmap <F6> :NERDTreeToggle<CR>
noremap <leader><enter> :LspCodeAction<CR>
noremap <leader>r :LspRename<CR>
noremap <leader>dd :LspDocumentDiagnostics<CR>
noremap <leader>ww :BufOnly<CR>
noremap <leader>b :LspDefinition<CR>
noremap <leader>B :rightbelow LspDefinition<CR>
noremap <leader>V :rightbelow vertical LspDefinition<CR>
noremap <leader>cf :noh<CR>
noremap <leader>f :Files<CR>
noremap <leader>F :Rg<CR>
noremap <leader>tn :TestNearest<CR>
noremap <leader>tf :TestFile<CR>

autocmd FileType * map <buffer> <leader>l :ALEFix<cr>
autocmd FileType typescript map <buffer> <leader>l :ALEFix<cr>
autocmd FileType typescriptreact map <buffer> <leader>l :ALEFix<cr>
autocmd FileType grads map <buffer> <leader>l :ALEFix<cr>
autocmd FileType javascript map <buffer> <leader>l :ALEFix<cr>
autocmd FileType json map <buffer> <leader>l :Prettier<cr>
autocmd FileType sass map <buffer> <leader>l :Prettier<cr>
autocmd FileType scss map <buffer> <leader>l :Prettier<cr>
autocmd FileType css map <buffer> <leader>l :Prettier<cr>

"============= Ale Lintint Settings ==============
" In ~/.vim/vimrc, or somewhere similar.

let g:ale_linters = {
\   'python': ['pylint'],
\}

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\   'typescript': ['eslint'],
\   'typescriptreact': ['eslint'],
\   'python': ['isort'],
\}

let g:ale_fix_on_save = 1
let g:ale_set_highlights = 0
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'

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
