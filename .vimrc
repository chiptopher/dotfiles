"================ Plug Plujgins ==================
call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'natebosch/vim-lsc'
Plug 'vim-test/vim-test'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'preservim/nerdtree'
Plug 'mattn/vim-lsp-settings'
Plug 'prettier/vim-prettier'
Plug 'python-mode/python-mode'
Plug 'Shougo/deoplete.nvim'
Plug 'lighttiger2505/deoplete-vim-lsp'
Plug 'liuchengxu/space-vim-dark'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

"============= Plugin Configuration ==============
colorscheme space-vim-dark
let test#java#runner = 'gradletest' "Configure vim-test to use gralde for java testing
let NERDTreeShowHidden=1

"============= Editor Configuration ==============
:set number
syntax on

set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
:set backspace=indent,eol,start

"================ Keybindings ================
nmap <F6> :NERDTreeToggle<CR>
:noremap <leader><enter> :LspCodeAction<CR>
:noremap <leader>r :LspRename<CR>
:noremap <leader>dd :LspDocumentDiagnostics<CR>
:noremap <leader>b :LspDefinition<CR>

"================ Cursor Settings ================
let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

"========== Highlight Cursor Line ===============
set cursorline
:hi CursorLine   cterm=NONE ctermbg=black
