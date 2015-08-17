" .vimrc by asyncee

" ============================================================
" OVERVIEW
" ============================================================
"
" Q                        format paragraph
" CTRL + hjkl              navigate between windows
" <Leader>n or m           switch between tabs
" F2                       toggle paste mode
" CTRL+SHIFT+N             navigate to file by name (pycharm)
" CTRL+F12                 show tags (pycharm)
" CTRL+Y                   copy to system buffer


" ============================================================
" GENERAL SETTINGS
" ============================================================
"
" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %


" Common settings
set nocompatible
set ruler                               "постоянно показывать позицию курсора
set linebreak                           "перенос по словам, а не по буквам
set showbreak=>                         "символ, отображающий продолжение строки
set whichwrap=<,>,[,],b,s               "не останавливаться курсору на конце строки
set autowrite                           "автоматом записывать изменения в файл при переходе к другому файлу
set showcmd showmode                    "показывать незавершенные команды и текущий режим
set splitbelow                          "новое окно появляется снизу
set splitright                          "новое окно появляется справа
set autochdir                           "текущий каталог всегда совпадает с содержимым активного окна
set noexrc                              "не читаем файл конфигурации из текущей директории
set list                                "отображаем табуляции и пробелы...
set listchars=tab:»\ ,trail:·,extends:>,precedes:<
set autoread                            "перечитывать файл при внешнем изменении
set backspace=2          "backspace acts like normal
set confirm                             "спрашивать подтверждение выхода
set helplang=ru                         "язык справки по умолчанию
set laststatus=2
set pastetoggle=<F2>
set clipboard=unnamed  " copy to system clipboard
set mouse=a
set scrolloff=3                         "скролим вверх или вниз за 2 строки от края
set sidescroll=1                        "скролим влево или за 2 строки от края
set sidescrolloff=4                     "скролим влево или за 2 строки от края
set tildeop                             "~ теперь оператор
set iminsert=0                  " раскладка по умолчанию для ввода - английская
set imsearch=0                  " раскладка по умолчанию для поиска - английская
set nofoldenable
set foldmethod=indent
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*
set wildignore+=*/env/*
set wildignore+=*/.git/*
let mapleader=","                       "leader-клавиша теперь запятая


" Encodings
set encoding=utf8                       "кодировка по дефолту
set termencoding=utf8                   "Кодировка вывода на терминал
set fileencodings=utf8,cp1251,koi8r     "Возможные кодировки файлов (автоматическая перекодировка)


" Remember last session
set sessionoptions-=options
au VimLeavePre * silent :mksession! $HOME/.vim/sessions/last.vim
"


" Show whitespaces and tabs
" This setting must be inserted before the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au BufRead,BufNewFile,InsertLeave * match ExtraWhitespace /\s\+$/
au BufRead,BufNewFile,InsertLeave *.* match ExtraWhitespace /^\t\+/


" Enable syntax highlighting
filetype off
filetype plugin indent on
syntax on


" Visual settings
set background=dark
set t_Co=256
set ttyfast                             "коннект с терминалом быстрый
set visualbell                          "мигаем вместо пищания
set showmatch                           "показываем открывающие и закрывающие скобки
set colorcolumn=80
color wombat256mod
highlight SpecialKey ctermfg=darkgray
highlight ColorColumn ctermbg=233
set cursorline                          "выделять строку с курсором
set cursorcolumn                        "показывать колонку курсора
au WinLeave * set nocursorline nocursorcolumn "нужно для отображения колонки
au WinEnter * set cursorline cursorcolumn     "курсора только в текущем окне


" History
set history=700
set undolevels=700


" Indents
set autoindent                          "при начале новой строки, отступ копируется из предыдущей
set smartindent                         "включаем умные отступы (в частности, отступы перед {, }, # и тд


" Search (case insensitive)
set hlsearch
set incsearch
set ignorecase
set smartcase


" Disable backup and swap files
set nobackup
set nowritebackup
set noswapfile


" Use spaces instead of TABs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab


" Autocompletion
set wildmenu                            "красивое автодополнение
set wildmode=longest:full,full                       "показать все совпадения


" Line numbers and length
set number         " show line numbers
set textwidth=79   " width of document (used by gd)
set nowrap         " don't automatically wrap on load
set formatoptions-=t          " don't automatically wrap text when typing

" ============================================================
" HACKS
" ============================================================

" отключаем фишку smartindent, когда строка, начинающаяся с # пишется без отступов
inoremap # X#


" Fixing the copy & paste madness
" ================================
vmap <C-y> y:call system("xclip -i -selection clipboard", getreg("\""))<CR>:call system("xclip -i", getreg("\""))<CR>
nmap <C-v> :call setreg("\"",system("xclip -o -selection clipboard"))<CR>p
imap <C-v> <Esc><C-v>a


" ============================================================
" KEY MAPPINGS
" ============================================================


" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h


" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>


" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation


" easier formatting of paragraphs
vmap Q gq
nmap Q gqap


" Better navigating through omnicomplete option list
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
set completeopt=longest,menuone
function! OmniPopup(action)
    if pumvisible()
        if a:action == 'j'
            return "\<C-N>"
        elseif a:action == 'k'
            return "\<C-P>"
        endif
    endif
    return a:action
endfunction

inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>


" Load previous session
map <F6> :source $HOME/.vim/sessions/last.vim<CR>

" ============================================================
" PLUGINS
" ============================================================


" Setup Pathogen to manage your plugins
" mkdir -p ~/.vim/autoload ~/.vim/bundle
" wget -O ~/.vim/autoload/pathogen.vim https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim
call pathogen#infect()


" Settings for powerline
" cd ~/.vim/bundle
" git clone https://github.com/powerline/powerline.git
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
let g:powerline_config_overrides = {'common': {'default_top_theme': 'unicode'}}


" Settings for ctrlp
" cd ~/.vim/bundle
" git clone https://github.com/kien/ctrlp.vim.git
let g:ctrlp_map = '<C-S-N>'  " PyCharm compatible shortcut


" Settings for jedi-vim
" cd ~/.vim/bundle/ 
" git clone --recursive https://github.com/davidhalter/jedi-vim.git
let g:jedi#usages_command = "<M-F7>"

" Ranbow parenthesis
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces


" Emmet-vim
" cd ~/.vim/bundle
" git clone https://github.com/mattn/emmet-vim.git


" Python folding
" cd ~/.vim/bundle
" git clone https://github.com/vim-scripts/Efficient-python-folding.git


" Tagbar
" dependency: ctags
" cd ~/.vim/bundle
" git clone https://github.com/majutsushi/tagbar.git
nmap <C-F12> :TagbarToggle<CR>
let g:tagbar_foldlevel = 0    " fold tags by default
