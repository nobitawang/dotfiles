call pathogen#runtime_append_all_bundles()
" call pathogen#helptags()

syntax on
set backspace=indent,eol,start
set encoding=utf8
set fileencoding=utf8
set fileencodings=utf8,cp950,latin1
set termencoding=utf8
set expandtab
set history=50
set hls
set incsearch
set modeline
" set mouse=a
set nocompatible
set nu
set ru
set shiftwidth=4
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
set tabstop=4
set t_Co=256
set list
set listchars=tab:>-,trail:.
set ambiwidth=double

" color schema
set background=dark
colo wombat256mod
highlight Search cterm=none ctermbg=blue

filetype plugin indent on

" python syntax highlight
let python_highlight_all = 1
let python_sync_slow = 1

" highlight extra whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" autocomplete
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType py set omnifunc=pythoncomplete
autocmd FileType python syntax keyword pythonDecorator True None False self
autocmd FileType css set omnifunc=csscomplete
autocmd BufNewFile,BufRead *.go set filetype=go sw=4 ts=4
autocmd BufNewFile,BufRead *.php set keywordprg="help" omnifunc=phpcomplete#CompletePHP
autocmd BufNewFile,BufRead *.mako so set filetype=mako
autocmd BufNewFile,BufRead *.gradle so set filetype=groovy
autocmd BufNewFile,BufRead *.thrift if &ft == 'conf' | set filetype=thrift
autocmd BufNewFile,BufRead *.json set ft=javascript

"shortcut keys
map th :tabprev<CR>
map tl :tabnext<CR>
map <f9> :Tlist<CR>

" set 4 spaces indent for zen coding
let g:user_zen_settings = {
\   'indentation': '    '
\}
" ctrl + e to trigger zend-coding
let g:user_zen_expandabbr_key = '<c-o>'

" javascript libraries syntax
let g:used_javascript_libs = 'jquery,angularjs,underscore'

let NERDTreeIgnore=['\~$', '\.lo$', '\.la$']

map <C-h> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
  \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
  \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

let g:acp_behaviorUserDefinedMeets = 'acp#meetsForKeyword'
let g:acp_behaviorUserDefinedFunction = 'syntaxcomplete#Complete'

autocmd BufReadPre *.js let b:javascript_lib_use_jquery = 1
autocmd BufReadPre *.js let b:javascript_lib_use_underscore = 1
autocmd BufReadPre *.js let b:javascript_lib_use_backbone = 0
autocmd BufReadPre *.js let b:javascript_lib_use_prelude = 0
autocmd BufReadPre *.js let b:javascript_lib_use_angularjs = 1
