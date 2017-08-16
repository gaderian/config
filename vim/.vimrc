set nu
"colorscheme evening
syntax on
"set shiftwidth=4
"set tabstop=4
"set expandtab
"set mouse=a
filetype plugin indent on

"indentation per file
autocmd Filetype markdown setlocal ts=4 sts=4 sw=4
autocmd Filetype .wiki setlocal ts=4 sts=4 sw=4

set wrap lbr

"highlights the current line when in insertmode
autocmd InsertEnter,InsertLeave * set cul!

" For folding, use z+c for fold and z+o to unfold
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=syntax

" Random settings
set encoding=utf8
set autoindent
set hlsearch
set lazyredraw
set incsearch
set wildmenu
set ruler

" indicates col 80
if exists('+colorcolumn')
	set colorcolumn=80
	highlight colorcolumn ctermbg=5*
endif

" Wraps/unwraps
"noremap <silent> <Leader>w :call ToggleWrap()<CR>
function ToggleWrap()
  if &wrap
    echo "Wrap OFF"
    setlocal nowrap
    set virtualedit=all
    silent! nunmap <buffer> <Up>
    silent! nunmap <buffer> <Down>
    silent! nunmap <buffer> <Home>
    silent! nunmap <buffer> <End>
    silent! iunmap <buffer> <Up>
    silent! iunmap <buffer> <Down>
    silent! iunmap <buffer> <Home>
    silent! iunmap <buffer> <End>
  else
    echo "Wrap ON"
    setlocal wrap linebreak nolist
    set virtualedit=
    setlocal display+=lastline
    noremap  <buffer> <silent> <Up>   gk
    noremap  <buffer> <silent> <Down> gj
    noremap  <buffer> <silent> <Home> g<Home>
    noremap  <buffer> <silent> <End>  g<End>
    inoremap <buffer> <silent> <Up>   <C-o>gk
    inoremap <buffer> <silent> <Down> <C-o>gj
    inoremap <buffer> <silent> <Home> <C-o>g<Home>
    inoremap <buffer> <silent> <End>  <C-o>g<End>
  endif
endfunction

" Copy row above
imap <F3> @<Esc>kyWjPA<BS>
nmap <F3> @<Esc>kyWjPA<BS>
imap <F2> <Esc>o<Esc>kyWjPA<BS><Space>
nmap <F2> <Esc>o<Esc>kyWjPA<BS><Space>

" Quick switching between tabs
imap <F7> <Esc>:tabp <Enter>
nmap <F7> <Esc>:tabp <Enter>
imap <F8> <Esc>:tabn <Enter>
nmap <F8> <Esc>:tabn <Enter>

" NERDtree toggling
nmap <F4> :NERDTreeToggle<CR>

" taglist toggling
nmap <F5> :TlistToggle<CR>
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Show_One_File = 1

"Load template if present
augroup templates
    au!
    " read in template files
    autocmd BufNewFile *.* silent! execute '0r ~/.vim/templates/skeleton.'.expand("<afile>:e")

    " parse special text in the templates after the read
    autocmd BufNewFile * %substitute#\[:VIM_EVAL:\]\(.\{-\}\)\[:END_EVAL:\]#\=eval(submatch(1))#ge
augroup END

"pathogen
execute pathogen#infect()

"vimwiki
let wiki_1 = {}
let wiki_1.path = '~/private/vimwiki/'
let wiki_1.path_html = '~/private/vimwiki_html/'

let g:vimwiki_list = [wiki_1]
