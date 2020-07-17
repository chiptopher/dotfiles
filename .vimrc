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
Plug 'Shougo/deoplete.nvim'
Plug 'lighttiger2505/deoplete-vim-lsp'
Plug 'liuchengxu/space-vim-dark'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'ap/vim-css-color'

call plug#end()

"============= Plugin Configuration ==============
colorscheme space-vim-dark
let test#java#runner = 'gradletest' "Configure vim-test to use gralde for java testing
let NERDTreeShowHidden=1
let g:NERDTreeWinSize=40
let g:pymode_rope_autoimport=1 "Enable rope commands from python-mode

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

"================ Keybindings ================
map <leader>q :NERDTreeFind<cr>
nmap <F6> :NERDTreeToggle<CR>
noremap <leader><enter> :LspCodeAction<CR>
noremap <leader>r :LspRename<CR>
noremap <leader>dd :LspDocumentDiagnostics<CR>
noremap <leader>b :LspDefinition<CR>
noremap <leader>V :rightbelow LspDefinition<CR>
noremap <leader>B :rightbelow vertical LspDefinition<CR>

autocmd FileType * map <buffer> <leader>l :LspDocumentFormat<cr>
autocmd FileType typescript map <buffer> <leader>l :Prettier<cr>
autocmd FileType typescriptreact map <buffer> <leader>l :Prettier<cr>
autocmd FileType javascript map <buffer> <leader>l :Prettier<cr>
autocmd FileType json map <buffer> <leader>l :Prettier<cr>

"================ Text Macros ================
:ia sout System.out.println();
:ia clog console.log();
:ia Assertions; import static org.assertj.core.api.Assertions.*;

"================ Cursor Settings ================
let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

"========== Highlight Cursor Line ===============
set cursorline

:hi CursorLine   cterm=NONE ctermbg=black
