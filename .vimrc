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
Plug 'jparise/vim-graphql'

Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'prisma/vim-prisma'
Plug 'tyru/open-browser.vim'
Plug 'tyru/open-browser-github.vim'
Plug 'vim-scripts/loremipsum'

let g:coc_global_extensions = [
  \ 'coc-tsserver'
  \ ]

Plug 'prisma/vim-prisma'

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

Plug 'rhysd/vim-clang-format'

call plug#end()

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
noremap <leader><enter> <Plug>(coc-codeaction)
nmap <leader>r <Plug>(coc-rename)
nmap <leader>rf <Plug>(coc-references)

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


"=
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"========== CoC Config ===============
" This config is largely lifted from here:
" https://github.com/neoclide/coc.nvim


" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
