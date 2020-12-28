set runtimepath+=~/.vim_runtime

" If installed using Homebrew
set rtp+=/usr/local/opt/fzf

" Line numbers
:set number relativenumber
" highlight LineNr term=bold cterm=NONE ctermfg=Grey ctermbg=NONE gui=NONE guifg=Grey guibg=NONE
" highlight CursorLineNr term=bold ctermfg=Yellow gui=bold guifg=Yellow
" hi CursorLine ctermfg=186
" :set cursorline 

" Plug
call plug#begin('~/.vim/plugged')


" Better vim settings
source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim

" Rainbow brackets
let g:rainbow_active = 1


" Syntax highlighting
call pathogen#infect()
syntax on
filetype plugin indent on

try
source ~/.vim_runtime/my_configs.vim
catch
endtry


" Remap to switch tabs
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Splits
nnoremap <leader>s <nop>
nnoremap <silent> <leader>ss <c-w>s
nnoremap <silent> <leader>sv <c-w>v
nnoremap <silent> <leader>sh :aboveleft vertical new<cr>
nnoremap <silent> <leader>sk :aboveleft new<cr>
nnoremap <silent> <leader>sj :belowright new<cr>
nnoremap <silent> <leader>sl :belowright vertical new<cr>
nnoremap <leader>t :tab new<cr>

" file ctl
nnoremap <leader>w <cmd>up<cr>
nnoremap <leader>q <cmd>q<cr>

" Remap jj to <ESC>. ctrl+c also works
inoremap jj <ESC>

" Skip closing bracket
inoremap <C-e> <esc>la

map NERDTree Toggle
map <C-t> :NERDTreeToggle<CR>


" Monokai Pro Theme
Plug 'phanviet/vim-monokai-pro'
set termguicolors 
colorscheme monokai_pro

" COC and Metals. Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}
nmap <Leader>ws <Plug>(coc-metals-expand-decoration)
set completeopt=noinsert,noselect,menuone

" Insert a new-line after the current line by pressing Enter (Shift-Enter for inserting a line before the current line)
nmap <C-m> O<Esc>
nmap <C-n> o<Esc>

" Lightline setting
Plug 'itchyny/lightline.vim'

function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

function! SetupCommandAbbrs(from, to)
  exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() ==# ":" && getcmdline() ==# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfunction
"

" coc.nvim lsp mappings
if filereadable(expand("~/.coc-mappings.vim"))
  source ~/.coc-mappings.vim"
endif

"Use C to open coc config
call SetupCommandAbbrs('cfg', 'CocConfig')

call SetupCommandAbbrs('COC', 'tabnew .coc-mappings.vim')
" Lightline status bar
let g:lightline = { 'colorscheme': 'deus',
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ],
        \             [ 'fugitive'],
        \             [ 'cocstatus', 'currentfunction', 'readonly', 'filename', 'modified' ] ]
        \ },
        \ 'component': {
        \   'readonly': '%{&filetype=="help"?"":&readonly?"🔒":""}',
        \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
        \   'fugitive': '%{exists("*FugitiveHead")?FugitiveHead():""}'
        \ },
        \ 'component_visible_condition': {
        \   'readonly': '(&filetype!="help"&& &readonly)',
        \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
        \   'fugitive': '(exists("*FugitiveHead") && ""!=FugitiveHead())'
        \},
        \ 'component_function': {
        \   'cocstatus': 'coc#status',
        \   'currentfunction': 'CocCurrentFunction'
        \ },
        \ 'separator': { 'left': ' ', 'right': ' ' },
        \ 'subseparator': { 'left': ' ', 'right': ' ' },
        \ }
set noshowmode
set wrapmargin=4
:set showcmd
set laststatus=2

" Cursor line
:set cursorline
hi clear CursorLine
augroup CLClear
    autocmd! ColorScheme * hi clear CursorLine
augroup END

:hi Visual cterm=reverse ctermbg=NONE
hi CursorLineNR cterm=bold,reverse ctermfg=184 ctermbg=None
augroup CLNRSet
    autocmd! ColorScheme * hi CursorLineNR cterm=reverse,bold ctergmfg=184 ctermbg=None
augroup END

" Highlight current word with ctrl+ k
nnoremap <C-K> :call HighlightNearCursor()<CR>
function HighlightNearCursor()
  if !exists("s:highlightcursor")
    match Todo /\k*\%#\k*/
    let s:highlightcursor=1
  else
    match None
    unlet s:highlightcursor
  endif
endfunction

" Mappping to toggle line numbers: ctl+n, ctrl+n
noremap <S-N><S-N> :set invnumber invrelativenumber<CR>
inoremap <S-N><S-N>:set invnumber invrelativenumber<CR>

" " Mapping to toggle golden ratio: ctrl+ g
" noremap <C-G><C-G> :GoldenRatioToggle<CR>

" NERDTree Syntax highlight
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
let g:NERDTreeLimitedSyntax = 1

" " FZF
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'

" NerdTree syntax highlighting
Plug 'ryanoasis/vim-devicons'
set encoding=UTF-8
set guifont=Sauce\ Code\ Pro\ Nerd\ Font\ 13

"Fugitive Vim Github Wrapper
Plug 'tpope/vim-fugitive'

" " You complete me
" Plug 'Valloric/YouCompleteMe'
" let g:ycm_key_list_stop_completion = ['<C-y>', '<S-Tab>' ]

" " Deoplete
" if has('nvim')
"   Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" else
"   Plug 'Shougo/deoplete.nvim'
"   Plug 'roxma/nvim-yarp'
"   Plug 'roxma/vim-hug-neovim-rpc'
" endif
" let g:deoplete#enable_at_startup = 1
" " <TAB>: completion.
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"


" whether or not to show the nerdtree brackets around flags
let g:webdevicons_conceal_nerdtree_brackets = 1

" Not working
augroup NerdTreeConceal
    autocmd!
    " Hide square brackets. Conceal level in the editor is handled by
    " indentLine.
    autocmd BufEnter NERD_tree_1 set conceallevel=3
augroup END

" Solve issues after re-sourcing files
if exists('g:loaded_webdevicons')
    call webdevicons#refresh()
endif

" Ctrl + l in insert mode to skip past brackets
inoremap <c-l> <esc>%%a


" Extra markdown goodies - requires godlygeek/tabular for the :TableFormat
" Nice stuff like:
" - navigation and folding based on headings using square brackets
" - following markdown links with ge
" - rendering ```foo ``` blocks with foo filetype
" - :HeaderIncrease and :HeaderDecrease
" - :TableFormat which formats the table under the cursor
" - :Toc quickfix window
Plug 'plasticboy/vim-markdown'

" Stop vim-markdown folding
" It's buggy and usually not wanted
let g:vim_markdown_folding_disabled = 1
" Turn off auto-indent
" It's buggy and unpredictable
let g:vim_markdown_new_list_item_indent = 0
" Stop auto-insertion of bullet points
" https://github.com/plasticboy/vim-markdown/pull/375
let g:vim_markdown_auto_insert_bullets = 0

" Unix commands like Sudo, Chmod
Plug 'tpope/vim-eunuch'

" Csv plugin
" Some really useful stuff - enough of it works to make it useful
Plug 'chrisbra/csv.vim'

" Adds the :Tabularize /[DELIM] command for formatting tabular text
Plug 'godlygeek/tabular'

" Scala plugins
Plug 'derekwyatt/vim-scala'
Plug 'derekwyatt/vim-sbt'
Plug 'GEverding/vim-hocon'

Plug 'kana/vim-textobj-user' | Plug 'kana/vim-textobj-line'

" General search settings
set incsearch " Search as you are typing
set wrapscan " Continue searching at top after hitting bottom
" Make lower case searches case-insensitive
" but any search containing an uppercase letter case-sensitive
set smartcase
set ignorecase

:set mousemodel=extend

:set nojoinspaces


call plug#end()

set mouse=a
