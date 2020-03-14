" Maintainer:   m4cr0v
" Last change:  09/18/2014 11:18:22 PM
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"         for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"       for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these configuration.
if v:progname =~? "evim"
    finish
endif

" Use Vim configuration, rather than Vi configuration (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
    set nobackup        " do not keep a backup file, use versions instead
else
    set backup      " keep a backup file
endif
set history=50      " keep 50 lines of command line history
set ruler       " show the cursor position all the time
set showcmd     " display incomplete commands
set incsearch       " do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
    "    set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
    syntax on
    set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

    " Enable file type detection.
    " Use the default filetype configuration, so that mail gets 'tw' set to 72,
    " 'cindent' is on in C files, etc.
    " Also load indent files, to automatically do language-dependent indenting.
    filetype plugin indent on

    " Put these in an autocmd group, so that we can delete them easily.
    augroup vimrcEx
    au!

    " For all text files set 'textwidth' to 78 characters.
    autocmd FileType text setlocal textwidth=78

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    " Also don't do it when the mark is in the first line, that is the default
    " position when opening a file.
    autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif

    augroup END
else
    set autoindent      " always set autoindenting on
endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
        \ | wincmd p | diffthis
endif



if (has("win32") || has("win95") || has("win64") || has("win16"))
    set nocompatible
    "source $VIMRUNTIME/vimrc_example.vim  "It has been copied to this doc before this line
    source $VIMRUNTIME/mswin.vim
    behave mswin

    set diffexpr=MyDiff()
    function MyDiff()
        let opt = '-a --binary '
        if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
        if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
        let arg1 = v:fname_in
        if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
        let arg2 = v:fname_new
        if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
        let arg3 = v:fname_out
        if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
        let eq = ''
        if $VIMRUNTIME =~ ' '
            if &sh =~ '\<cmd'
                let cmd = '""' . $VIMRUNTIME . '\diff"'
                let eq = '"'
            else
                let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
            endif
        else
            let cmd = $VIMRUNTIME . '\diff'
        endif
        silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
    endfunction
endif



""""""""""""""""""""""""""""""
" configuration
""""""""""""""""""""""""""""""
"all plugins
"vim-scripts/a.vim
"vim-scripts/bash-support.vim  :h bashsupport
"vim-scripts/bufexplorer.zip  :h bufexplorer
"vim-scripts/c.vim  :h csupport  （出自WolfgangMehner / vim-plugins）
"vim-scripts/cecutil  :h cecutil
"vim-scripts/cmdline-completion
"vim-scripts/DrawIt  :h DrawIt
"vim-scripts/echofunc.vim
"vim-scripts/genutils
"vim-scripts/grep.vim
"vim-scripts/lookupfile  :h lookupfile
"vim-scripts/matrix.vim
"vim-scripts/minibufexpl.vim
"vim-scripts/sketch.vim
""vim-scripts/snipMate  :h snipMate  20140420弃用
"vim-scripts/taglist.vim  :h taglist.txt
"vim-scripts/The-NERD-tree  :h NERD_tree
"vim-scripts/VimIM
"vim-scripts/Visual-Mark
"vim-scripts/winmanager  :h winmanager
"bling/vim-airline  :h airline
"dyng/ctrlsf.vim  :h ctrlsf  <C-j>next  <C-k>previous  p preview
"godlygeek/tabular  :h tabular
"honza/vim-snippets  （给Snipmate或UltiSnip用的Snippets）
"kien/ctrlp.vim  :h ctrlp
"Lokaltog/vim-easymotion  :h easymotion
"mbbill/fencview
"nathanaelkane/vim-indent-guides  :h indent-guides
"rosenfeld/conque-term  :help ConqueTerm  （vim-scripts/Conque-Shell上的不全，只能找个个人repo）
"SirVer/ultisnips  :h ultisnips
"sjl/gundo.vim  :h gundo
"terryma/vim-expand-region  :h vim-expand-region
"terryma/vim-multiple-cursors  :h vim-multiple-cursors
"tmhedberg/SimpylFold  :h SimpylFold
"Valloric/YouCompleteMe  :h YouCompleteMe
"vim-voom/VOoM"  :h voom
"wesleyche/SrcExpl  :h srcexpl
"wesleyche/Trinity
"Yggdroot/LeaderF  :h leaderf
"Vimjas/vim-python-pep8-indent
"tpope/vim-speeddating  :h speeddating

""""""""""""""""""""""""""""""
" key map
""""""""""""""""""""""""""""""
" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","
let maplocalleader = ","
let g:maplocalleader = ","
"code style
nmap <leader>cs :%!indent -kr -i8<cr>
"open vimrc file
if (has("win32") || has("win95") || has("win16"))
    nmap <leader>rc :e C:/Program\ Files/Vim/_vimrc<cr>
elseif (has("win64"))
    nmap <leader>rc :e C:/Program\ Files\ (x86)/Vim/_vimrc<cr>
elseif (has("unix"))
    nmap <leader>rc :e ~/.vimrc<cr>
endif
""""""""""""""""""""""""""""""
" encoding configuration
""""""""""""""""""""""""""""""
"file encodings
set encoding=utf-8
"set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

""""""""""""""""""""""""""""""
" Display Line Numbers
""""""""""""""""""""""""""""""
set nu
""""""""""""""""""""""""""""""
" Some configuration
""""""""""""""""""""""""""""""
"setlocal spell spelllang=en_us
colorscheme evening
filetype plugin indent on
"set filetype=c "not necessary when filetype on
if (has("win32") || has("win95") || has("win16"))
    helptags C:\Program Files\Vim\vimfiles\doc
elseif (has("win64"))
    helptags C:\Program Files (x86)\Vim\vimfiles\doc
elseif has("unix")
    helptags ~/.vim/doc
endif
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set nobackup

""""""""""""""""""""""""""""""
" Fold configuration
""""""""""""""""""""""""""""""
set foldcolumn=5 "Display Fold With + and -
set foldmethod=syntax
set foldlevel=100 "do not fold while starting

""""""""""""""""""""""""""""""
" Automatically add Python paths to Vim path
""""""""""""""""""""""""""""""
if has("unix")
" http://vim.wikia.com/wiki/Automatically_add_Python_paths_to_Vim_path
python << endpython
import os
import sys
import vim
for p in sys.path:
    # Add each directory in sys.path, if it exists.
    if os.path.isdir(p):
        # Command 'set' needs backslash before each space.
        vim.command(r"set path+=%s" % (p.replace(" ", r"\ ")))
endpython
endif

""""""""""""""""""""""""""""""
" vundle configuration
""""""""""""""""""""""""""""""
"git clone https://github.com/gmarik/Vundle.vim.git "C:/Program Files (x86)/Vim/bundle/Vundle.vim" "for windows x64
"git clone https://github.com/gmarik/Vundle.vim.git "C:/Program Files/Vim/bundle/Vundle.vim" "for windows x86
"git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim "for Linux
set nocompatible " be iMproved
filetype off " required!

if (has("win32") || has("win95") || has("win16"))
    set rtp+=C:/Program\ Files/Vim/bundle/Vundle.vim/
    call vundle#rc('C:/Program Files/Vim/bundle/')
elseif (has("win64"))
    set rtp+=C:/Program\ Files\ (x86)/Vim/bundle/Vundle.vim/
    call vundle#rc('C:/Program Files (x86)/Vim/bundle/')
elseif has("unix")
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#rc()
endif

" let Vundle manage Vundle
" required!
Bundle 'gmarik/Vundle.vim'

" My Bundles here:
"
" original repos on github
"Bundle 'tpope/vim-fugitive'
"Bundle 'Lokaltog/vim-easymotion'
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
"Bundle 'tpope/vim-rails.git'

" vim-scripts repos
"Bundle 'L9'
"Bundle 'FuzzyFinder'

"xForce's plugins
Bundle 'a.vim'
Bundle 'bash-support.vim'
Bundle 'bufexplorer.zip'
Bundle 'c.vim'
Bundle 'cecutil'
Bundle 'cmdline-completion'
Bundle 'DrawIt'
Bundle 'echofunc.vim'
Bundle 'genutils'
Bundle 'grep.vim'
Bundle 'lookupfile'
Bundle 'matrix.vim'
Bundle 'minibufexpl.vim'
Bundle 'sketch.vim'
"Bundle 'snipMate'
Bundle 'taglist.vim'
Bundle 'The-NERD-tree'
Bundle 'VimIM'
Bundle 'Visual-Mark'
Bundle 'winmanager'
Bundle 'bling/vim-airline'
Bundle 'dyng/ctrlsf.vim'
Bundle 'godlygeek/tabular'
Bundle 'honza/vim-snippets'
Bundle 'kien/ctrlp.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'mbbill/fencview'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'rosenfeld/conque-term'
Bundle 'SirVer/ultisnips'
Bundle 'sjl/gundo.vim'
Bundle 'terryma/vim-expand-region'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'tmhedberg/SimpylFold'
Bundle 'Valloric/YouCompleteMe'
Bundle 'vim-voom/VOoM'
Bundle 'wesleyche/SrcExpl'
Bundle 'wesleyche/Trinity'
Bundle 'Yggdroot/LeaderF'
Bundle 'Vimjas/vim-python-pep8-indent'
Bundle 'tpope/vim-speeddating'

" non github repos
"Bundle 'git://git.wincent.com/command-t.git'
" ...

filetype plugin indent on " required!
"
" Brief help
" :BundleList - list configured bundles
" :BundleInstall(!) - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!) - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

""""""""""""""""""""""""""""""
" Ctags configuration
""""""""""""""""""""""""""""""
"cd /home/xforce/files/usbcam/
"for c++
"!ctags -R --c++-kind=+p --fields=+aS --extra=+q
"for c
"!ctags -R 
"cd -
"set tags=/home/xforce/files/usbcam/tags
set tags=/mnt/hgfs/H/Download/usbcam/tags


""""""""""""""""""""""""""""""
" winManager configuration
""""""""""""""""""""""""""""""
"let g:winManagerWindowLayout = "FileExplorer,BufExplorer|TagList"
let g:winManagerWindowLayout = "NERDTree,BufExplorer|TagList"
let g:winManagerWidth = 30
let g:defaultExplorer = 0
nmap <C-W><C-F> :FirstExplorerWindow<cr>
nmap <C-W><C-B> :BottomExplorerWindow<cr>
"nmap <silent> <leader> wm :WMToggle<cr>
"nmap wm :WMToggle<cr>
nmap wm :if IsWinManagerVisible() <BAR> WMToggle<CR> <BAR> else <BAR> WMToggle<CR>:q<CR> endif <CR><CR>

""""""""""""""""""""""""""""""
" complete configuration
""""""""""""""""""""""""""""""
filetype plugin indent on
set completeopt=longest,menu "close the preview window


""""""""""""""""""""""""""""""
" Cscope configuration
""""""""""""""""""""""""""""""
"cd /home/xforce/files/usbcam
"!cscope -Rbq
"cd -
"set cscopequickfix=s-,c-,d-,i-,t-,e-
"cs add /home/xforce/files/usbcam/cscope.out /home/xforce/files/usbcam


""""""""""""""""""""""""""""""
" Grep configuration
""""""""""""""""""""""""""""""
"nnoremap <silent> <F3> :GrepBuffer<CR>
nnoremap <F3> :GrepBuffer<CR>

""""""""""""""""""""""""""""""
" LookupFile and genutils configuration
""""""""""""""""""""""""""""""
"#!/bin/sh 
"# generate tag file for lookupfile plugin 
"echo -e "!_TAG_FILE_SORTED\t2\t/2=foldcase/"> filenametags 
"find . -not -regex '.*\.\(png\|gif\|pyc\)' ! -path "*svn*" -type f -printf "%f\t%p\t1\n" | sort -f>> filenametags 
"if filereadable("./filenametags") "otherwise lookupfile will use the tag file of ctags
"let g:LookupFile_TagExpr='"./filenametags"'
"endif
let g:LookupFile_MinPatLength=2 "enter at least 2 characters
let g:LookupFilePreserveLastPattern=0 "do not save last pattern
let g:LookupFile_PreservePatternHistory = 1 "save pattern history
let g:LookupFile_AlwaysAcceptFirst = 1 "press enter to open first match
let g:LookupFile_AllowNewFiles =0 "not allowed to creat new file
"映射LookupFile为,lk
"nmap <silent> <leader>lk :LUTags<cr>
"映射LUBufs为,ll
"nmap <silent> <leader>ll :LUBufs<cr>
"映射LUWalk为,lw
"nmap <silent> <leader>lw :LUWalk<cr>

 

""""""""""""""""""""""""""""""
" InfoBackup configuration 
""""""""""""""""""""""""""""""
set sessionoptions-=curdir
set sessionoptions+=sesdir
"mksession ./infobackup/xforce.vim "do this to backup before exiting vim
"source ./infobackup/xforce.vim "do this to recover after starting vim
"wviminfo ./infobackup/xforce.viminfo "do this to backup before exiting vim
"rviminfo ./infobackup/xforce.viminfo "do this to recover after starting vim


""""""""""""""""""""""""""""""
" NERD_Tree configuration 
""""""""""""""""""""""""""""""
let g:NERDTree_title="[NERDTree]"
function! NERDTree_Start()
    exec 'NERDTree'
endfunction
function! NERDTree_IsValid()
    return 1
endfunction

""""""""""""""""""""""""""""""
" miniBufExplorer configuration 
""""""""""""""""""""""""""""""
let g:miniBufExplMapCTabSwitchBufs=1

""""""""""""""""""""""""""""""
" snipMate configuration 
""""""""""""""""""""""""""""""
"let g:snips_author = 'm4cr0v'

""""""""""""""""""""""""""""""
" SrcExpl configuration 
""""""""""""""""""""""""""""""
" // The switch of the Source Explorer 
" nmap <F8> :SrcExplToggle<CR> 
" // Set the height of Source Explorer window 
" let g:SrcExpl_winHeight = 8 
" // Set 100 ms for refreshing the Source Explorer 
" let g:SrcExpl_refreshTime = 100 
" // Set "Enter" key to jump into the exact definition context 
let g:SrcExpl_jumpKey = "<ENTER>" 
" // Set "Space" key for back from the definition context 
let g:SrcExpl_gobackKey = "<SPACE>" 
" // In order to Avoid conflicts, the Source Explorer should know what plugins 
" // are using buffers. And you need add their bufname into the list below 
" // according to the command ":buffers!" 
" let g:SrcExpl_pluginList = [ 
"        \ "__Tag_List__", 
"        \ "_NERD_tree_", 
"        \ "Source_Explorer" 
"    \ ] 

" // Enable/Disable the local definition searching, and note that this is not 
" // guaranteed to work, the Source Explorer doesn't check the syntax for now. 
" // It only searches for a match with the keyword according to command 'gd' 
let g:SrcExpl_searchLocalDef = 0 
" // Do not let the Source Explorer update the tags file when opening 
" let g:SrcExpl_isUpdateTags = 0 
" // Use 'Exuberant Ctags' with '--sort=foldcase -R .' or '-L cscope.files' to 
" // create/update the tags file 
" let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R ." 
" // Set "<F12>" key for updating the tags file artificially 
" let g:SrcExpl_updateTagsKey = "<F12>" 
" // Set "<F3>" key for displaying the previous definition in the jump list 
" let g:SrcExpl_prevDefKey = "<F3>" 
" // Set "<F4>" key for displaying the next definition in the jump list 
let g:SrcExpl_nextDefKey = "<F4>" 



""""""""""""""""""""""""""""""
" vim-expand-region configuration
""""""""""""""""""""""""""""""
map <SPACE> <Plug>(expand_region_expand)
map <leader><SPACE> <Plug>(expand_region_shrink)

""""""""""""""""""""""""""""""
" VimIM configuration
""""""""""""""""""""""""""""""
if has("unix")
    "!wget http://vimim-data.googlecode.com/svn/trunk/data/vimim.pinyin_quote_sogou.txt -P ~/.vim/bundle/VimIM/plugin
else
    "!wget http://vimim-data.googlecode.com/svn/trunk/data/vimim.pinyin_quote_sogou.txt -P $VIM/bundle/VimIM/plugin
endif

""""""""""""""""""""""""""""""
" ultisnips configuration 
""""""""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

""""""""""""""""""""""""""""""
" YouCompleteMe configuration
""""""""""""""""""""""""""""""
" download and install llvm-libs, llvm and clang
" cd ~/.vim/bundle/YouCompleteMe
" ./install.sh --clang-completer --system-libclang
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

nmap <leader>gd :YcmCompleter GoTo<CR>

""""""""""""""""""""""""""""""
" indent-guides configuration
""""""""""""""""""""""""""""""
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
let g:indent_guides_guide_size=1

""""""""""""""""""""""""""""""
" vim-airline configuration
""""""""""""""""""""""""""""""
"let g:airline_section_b = '%{strftime("%c")}'
"let g:airline_section_y = 'BN: %{bufnr("%")}'
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'

""""""""""""""""""""""""""""""
" vim-python-pep8-indent configuration
""""""""""""""""""""""""""""""
"let g:python_pep8_indent_multiline_string = 0
"let g:python_pep8_indent_hang_closing = 0

""""""""""""""""""""""""""""""
" 
""""""""""""""""""""""""""""""
