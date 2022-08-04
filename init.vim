set shell=/bin/zsh
set encoding=UTF-8
set guicursor
set relativenumber
set nu
set hlsearch
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set wrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set noshowmode
set completeopt=menuone,noinsert,noselect
set colorcolumn=80
set signcolumn=yes
set cmdheight=2
set updatetime=50
call plug#begin('~/.config/nvim/plugged')
Plug 'ggandor/lightspeed.nvim' "add jump in vim 
"Plug 'cposture/coc-thrift-syntax-support', {'do': 'yarn install --frozen-lockfile && yarn build'}
Plug 'solarnz/thrift.vim'
Plug 'google/vim-jsonnet'
"Plug 'ryanoasis/vim-devicons'
Plug 'tjdevries/coc-zsh'
"Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'rust-lang/rust.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'tpope/vim-eunuch'
Plug 'gruvbox-community/gruvbox'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'davidhalter/jedi-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'moll/vim-bbye'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'preservim/nerdcommenter'
Plug 'preservim/tagbar'
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jpalardy/vim-slime'
Plug 'hanschen/vim-ipython-cell', { 'for': 'python' }
Plug 'tpope/vim-obsession'
Plug 'unkiwii/vim-nerdtree-sync'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'mileszs/ack.vim'
Plug 'mfussenegger/nvim-jdtls'
"Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'octol/vim-cpp-enhanced-highlight'
" Also add Glaive, which is used to configure codefmt's maktaba flags. See
" `:help :Glaive` for usage.

Plug 'andrejlevkovitch/vim-lua-format'
"vim test 
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

Plug 'vim-test/vim-test'
Plug 'alepez/vim-gtest'
"Plug "rcarriga/vim-ultest", { "do": ":UpdateRemotePlugins" }
Plug 'airblade/vim-gitgutter'
"Plug 'takac/vim-hardtime'
"the xmake plugin 
Plug 'luzhlon/xmake.vim'
Plug 'luzhlon/x.vim'
Plug 'luzhlon/qrun.vim'
Plug 'github/copilot.vim'
"Plug 'puremourning/vimspector'
Plug 'tpope/vim-fugitive'
Plug 'voldikss/vim-codelf'
Plug 'Yggdroot/indentLine'
Plug 'mattn/webapi-vim'
Plug 'mattn/vim-gist'
"Plug 'timonv/vim-cargo' 
Plug 'cdelledonne/vim-cmake'
Plug 'ianding1/leetcode.vim'
Plug 'lervag/vimtex'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'liuchengxu/vista.vim'
"Plug 'soramugi/auto-ctags.vim'
Plug 'tenfyzhong/tagbar-ext.vim'
Plug 'preservim/vimux'
Plug 'Shougo/unite.vim'
Plug 'wsdjeg/JavaUnit.vim'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'bazelbuild/vim-bazel'
Plug 'bazelbuild/vim-ft-bzl'
Plug 'dylon/vim-antlr'
Plug 'aperezdc/vim-template'
Plug 'google/vim-glaive'
call plug#end()

call glaive#Install()
"call mkdp#util#install()
Glaive codefmt plugin[mappings]
Glaive codefmt google_java_executable="java -jar /Users/hudengjun/github/google-java-format/core/target/google-java-format-HEAD-SNAPSHOT-all-deps.jar"
colorscheme gruvbox
inoremap kj <ESC>
cnoremap kj <esc>

if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

"highlight Normal guibg=none
"let mapleader=" "
"nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
"
"fun! TrimWhitespace()
"    let l:save = winsaveview()
"    keeppatterns %s/\s\+$//e
"    call winrestview(l:save)
"endfun
"
"augroup THE_PRIMEAGEN
"    autocmd!
"    autocmd BufWritePre * : call TrimWhitespace()
"augroup END
"
"
augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto,javascript,arduino AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer yapf
  " Alternative: autocmd FileType python AutoFormatBuffer autopep8
  autocmd FileType rust AutoFormatBuffer rustfmt
  autocmd FileType vue AutoFormatBuffer prettier
  autocmd FileType lua AutoFormatBuffer lua-fmt
augroup END

autocmd BufWrite *.lua call LuaFormat()
"this is for nerdcommenter
filetype plugin on 
source ~/.config/nvim/coco_config.vim
let mapleader=","
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>l <Plug>(go-lint)
au FileType go nmap <leader>i <Plug>(go-imports)
au FileType go nmap <leader>f <Plug>(go-fmt)
au FileType go nmap <leader>d <Plug>(go-doc)
"nnoremap <Leader>q :Bdelete<CR>
nnoremap bd :bd<CR>

"somple for rust 
au FileType rust nmap <leader>r :!cargo run<CR>
au FileType rust nmap <leader>b :!cargo build<CR>
au FileType vim nmap <leader>r :source %<CR>
au FileType javascript nmap <leader>r :!node %<CR>

au FileType markdown nmap <leader>r :MarkdownPreview<CR>
au FileType markdown nmap <leader>f :CocCommand markdownlint.fixAll<CR>

au FileType cpp nmap <leader>r :!time g++ --std=c++20 -I /opt/vcpkg/installed/x64-osx/include  -L /opt/vcpkg/installed/x64-osx/lib   % -o test  && ./test <CR>

au FileType cpp nmap <leader>R :!time g++ --std=c++20 -I /opt/vcpkg/installed/x64-osx/include  -L /opt/vcpkg/installed/x64-osx/lib  -lgflags -lglog -lfmt -lmurmurhash -lbenchmark  -lfolly -lfolly_test_util  -lfollybenchmark -lgtest -ldouble-conversion -lgtest_main % -o test  && echo "finished"<CR>
au FileType lua nmap <leader>r :!lua %<CR>

"simple for cmake file  

nmap <silent> [e <Plug>(coc-diagnostic-prev)
nmap <silent> ]e <Plug>(coc-diagnostic-next)


"set the slime config 
let g:slime_target = "tmux"
let g:slime_paste_file = "$HOME/.slime_paste"
let g:slime_default_config = {"socket_name": get(split($TMUX, ","), 0), "target_pane": ":.1"}

"ipython cell config
let g:slime_python_ipython = 1
let g:slime_dont_ask_default = 1
" map <Leader>s to start IPython
"nnoremap <Leader>ss :SlimeSend1 ipython --matplotlib<CR>
nnoremap <Leader>ss :SlimeSend1 ipython <CR>
nnoremap <Leader>sp :SlimeSend1 PYSPARK_DRIVER_PYTHON=ipython pyspark <CR>
nnoremap <Leader>sl :SlimeSend1 scala <CR>
" map <Leader>r to run script
"nnoremap <Leader>r :IPythonCellRun<CR>

" map <Leader>R to run script and time the execution
autocmd FileType python nnoremap <Leader>R :IPythonCellRunTime<CR>

" map <Leader>c to execute the current cell
nnoremap <Leader>c :IPythonCellExecuteCell<CR>

" map <Leader>C to execute the current cell and jump to the next cell
nnoremap <Leader>C :IPythonCellExecuteCellJump<CR>

" map <Leader>l to clear IPython screen
"nnoremap <Leader>l :IPythonCellClear<CR>

" map <Leader>x to close all Matplotlib figure windows
nnoremap <Leader>x :IPythonCellClose<CR>

" map [c and ]c to jump to the previous and next cell header
nnoremap [c :IPythonCellPrevCell<CR>
nnoremap ]c :IPythonCellNextCell<CR>

" map <Leader>h to send the current line or current selection to IPython
nmap <Leader>h <Plug>SlimeLineSend
xmap <Leader>h <Plug>SlimeRegionSend

" map <Leader>p to run the previous command
nnoremap <Leader>p :IPythonCellPrevCommand<CR>

" map <Leader>Q to restart ipython
nnoremap <Leader>Q :IPythonCellRestart<CR>

" map <Leader>d to start debug mode
nnoremap <Leader>d :SlimeSend1 %debug<CR>

" map <Leader>q to exit debug mode or IPython
nnoremap <Leader>q :SlimeSend1 exit<CR>

" map <F9> and <F10> to insert a cell header tag above/below and enter insert mode
nmap <F9> :IPythonCellInsertAbove<CR>a
nmap <F10> :IPythonCellInsertBelow<CR>a

" also make <F9> and <F10> work in insert mode
imap <F9> <C-o>:IPythonCellInsertAbove<CR>
imap <F10> <C-o>:IPythonCellInsertBelow<CR>


"append edit zshrc file
nnoremap <leader>ez :vsplit ~/.zshrc<CR>
nnoremap <leader>sz :!source ~/.zshrc<CR>

"append by vimscript book learned
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>


"daily work edit
nnoremap <leader>ed :vsplit ~/use_books/daily_work.md<CR>
"nnoremap <leader>sd :edit ~/use_books/"strftime("%Y-%m-%d").md"




inoremap <esc> <nop>
iabbrev adn and
iabbrev tqmd tqdm
iabbrev waht what 

" vim -b : edit binary using xxd-format!
augroup Binary
  au!
  au BufReadPre  *.bin let &bin=1
  au BufReadPost *.bin if &bin | %!xxd
  au BufReadPost *.bin set ft=xxd | endif
  au BufWritePre *.bin if &bin | %!xxd -r
  au BufWritePre *.bin endif
  au BufWritePost *.bin if &bin | %!xxd
  au BufWritePost *.bin set nomod | endif
augroup END



"vim test 
"let g:hardtime_default_on=1
let test#python#pytest#options = "--color=yes"
nmap ]t <Plug>(ultest-next-fail)
nmap [t <Plug>(ultest-prev-fail)


" these "Ctrl mappings" work well when Caps Lock is mapped to Ctrl
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> tt :TestNearest<CR>
nmap <silent> tf :TestFile<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>

augroup GTest
	autocmd FileType cpp nnoremap <silent> <leader>tt :GTestRun<CR>
	autocmd FileType cpp nnoremap <silent> <leader>tu :GTestRunUnderCursor<CR>
	autocmd FileType cpp nnoremap          <leader>tc :GTestCase<space>
	autocmd FileType cpp nnoremap          <leader>tn :GTestName<space>
	autocmd FileType cpp nnoremap <silent> <leader>te :GTestToggleEnabled<CR>
	autocmd FileType cpp nnoremap <silent> ]T         :GTestNext<CR>
	autocmd FileType cpp nnoremap <silent> [T         :GTestPrev<CR>
	autocmd FileType cpp nnoremap <silent> <leader>tf :CtrlPGTest<CR>
	autocmd FileType cpp nnoremap <silent> <leader>tj :GTestJump<CR>
	autocmd FileType cpp nnoremap          <leader>ti :GTestNewTest<CR>i
augroup END
  "\ 'nearest': 'vimux',
  "\ 'file':    'neovim',
  "\ 'suite':   'basic',
let test#strategy = {
  \ 'nearest': 'vimux',
  \ 'file':    'vimux',
  \ 'suite':   'vimux',
\}

"the vim-gitgutter plugin to show the changed code lines
au VimEnter * exec 'GitGutterEnable'
au VimEnter * exec 'GitGutterBufferEnable'
au VimEnter * exec 'GitGutterSignsEnable'
highlight link GitGutterAddLine Underlined       " default: links to DiffAdd
highlight link GitGutterChangeLine Underlined      " default: links to DiffChange
highlight link GitGutterDeleteLine DiffText     " default: links to DiffDelete
highlight link GitGutterChangeDeleteLine Underlined  " default: links to GitGutterChangeLineDefault, i.e. DiffChange
let g:gitgutter_sign_added = 'xx'
let g:gitgutter_sign_modified = 'yy'
let g:gitgutter_sign_removed = 'zz'
let g:gitgutter_sign_removed_first_line = '^^'
let g:gitgutter_sign_removed_above_and_below = '{'
let g:gitgutter_sign_modified_removed = 'ww'
set updatetime=100
set signcolumn=yes
highlight GitGutterAdd    ctermfg=blue
highlight GitGutterChange ctermfg=green
highlight GitGutterDelete ctermfg=red
let g:nerdtree_sync_cursorline = 1
let g:NERDTreeHighlightCursorline = 1
"let g:ackprg = 'ag --nogroup --nocolor --column'
let g:ackprg ='ag --vimgrep'

cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>
nnoremap <leader>tb :Tagbar<CR>
"
"remap the buffer swith
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
nnoremap <leader>n :NERDTree<CR>

"packadd! vimspector
let g:vimspector_enable_mappings = 'HUMAN'
let g:vimspector_install_gadgets = [ 'debugpy', 'vscode-cpptools', 'CodeLLDB' ]
nnoremap <leader>m :MaximizerToggle!<CR>
nnoremap <leader>dd :call vimspector#Launch()<CR>
nnoremap <leader>dc :call GotoWindow(g:vimspector_session_windows.code)<CR>
nnoremap <leader>dt :call GotoWindow(g:vimspector_session_windows.tagpage)<CR>
nnoremap <leader>dv :call GotoWindow(g:vimspector_session_windows.variables)<CR>
nnoremap <leader>dw :call GotoWindow(g:vimspector_session_windows.watches)<CR>
nnoremap <leader>ds :call GotoWindow(g:vimspector_session_windows.stack_trace)<CR>
nnoremap <leader>do :call GotoWindow(g:vimspector_session_windows.output)<CR>
nnoremap <leader>de :call vimspector#Reset()<CR>

nnoremap <leader>dtcb :call vimspector#CleanLineBreakpoint()<CR>

nmap <leader>dl <Plug>VimspectorStepInto
nmap <Leader>di <Plug>VimspectorBalloonEval
xmap <Leader>di <Plug>VimspectorBalloonEval
nmap <leader>dj <Plug>VimspectorStepOver
nmap <leader>dk <Plug>VimspectorStepOut
nmap <leader>d_ <Plug>VimspectorRestart
nmap <leader>dq <Plug>VimspectorReset 
nnoremap <leader>d<space> :call vimspector#Continue()<CR>

nmap <leader>drc <Plug>VimspectorRunToCursor
nmap <leader>dbp <Plug>VimspectorToggleBreakpoint
nmap <leader>dcbp <Plug>VimspectorToggleConditionalBreakpoint

let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
set guifont=DejaVu\ Sans:s12
nnoremap tk  :tabnext<CR>
nnoremap tj  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap th  :tabfirst<CR>
nnoremap td  :tabclose<CR>
" Alternatively use
"nnoremap th :tabnext<CR>
"nnoremap tl :tabprev<CR>
"nnoremap tn :tabnew<CR>
let g:airline_theme='base16_atelierdune'

set dictionary+=/usr/share/dict/words

"codelf 
"inoremap <silent> <F9> <C-R>=codelf#start()<CR>
"nnoremap <silent> <F9> :codelf#start()<CR>
"nnoremap <Leader>bl :ls<CR>
"nnoremap <Leader>bp :bp<CR>
"nnoremap <Leader>bn :bn<CR>
nnoremap <C-k> :bprevious<CR> 
nnoremap <C-j> :bnext<CR>
"map the h l for window switch and j k for buffer switch
let g:rustfmt_autosave = 1

"leetcode browser 
let g:leetcode_browser = 'chrome'
let g:leetcode_solution_filetype='python3'
let g:leetcode_china=100
let g:leetcode_hide_paid_only=1

nnoremap <leader>nll :LeetCodeList<cr>
nnoremap <leader>nlt :LeetCodeTest<cr>
nnoremap <leader>nls :LeetCodeSubmit<cr>
nnoremap <leader>nli :LeetCodeSignIn<cr>

autocmd FileType php noremap <leader>r :w!<CR>:!/usr/bin/php %<CR>

source ~/.config/nvim/latex.vim
let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1
let github_user = 'hudengjunai'

set tags=./.tags;,.tags
let g:auto_ctags = 1
let g:auto_ctags_directory_list = ['.git', '.svn']
let g:auto_ctags_tags_name = '.tags'
let g:auto_ctags_tags_args = ['--tag-relative=yes', '--recurse=yes', '--sort=yes']
let g:auto_ctags_filetype_mode = 1
let g:auto_ctags_set_tags_option = 1

"autocmd BufWritePost *.rb :call CTags()
let g:lsp_cxx_hl_use_text_props = 1


let g:cpp_class_scope_highlight = 1 
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1

"autocmd chapter, event pattern,command
autocmd BufWritePre,BufRead *.html :normal gg=G
"autocmd group  for autowrite when leave insert mode , search in  https://vi.stackexchange.com/questions/26415/autosave-in-vim-causing-side-effects 
autocmd InsertLeave,TextChanged,FocusLost * silent! write 

let g:gtest#print_time =1 
autocmd FileType markdown setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
"set tags=./tags,tags
au BufRead,BufNewFile *.g set filetype=antlr3
au BufRead,BufNewFile *.g4 set filetype=antlr4
" loading the plugin
let g:webdevicons_enable = 1
" adding the flags to NERDTree
let g:webdevicons_enable_nerdtree = 1

let g:templates_no_autocmd = 0
let g:gtest#highlight_failing_tests = 1
