" Конфигурационный файл jungo {{{
" Спасибо всем, кто выложил в открытый доступ статьи,
" конфигурационные файлы для vim, описание плагинов.
" Это помогло мне в создании этого конфига.
" http://welinux.ru
" http://h0rr0rr-drag0n.blogspot.com
" http://vimeo.com
" http://habrahabr.ru
" ...и многим другим...
" }}}
" Внешние зависимости {{{
" ctags
" pep8
" }}}
" Команды, которые должны быть выполнены первыми {{{
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
" }}}
" Команды для интерпретатора python {{{
" заставляем vim импортировать модуль django.db
" vim надо открывать из директории проекта с settings.py
"python << EOF
"import os
"import sys
"import vim
"sys.path.append("/home/jungo/django/")
"sys.path.append(os.getcwd())
"if 'settings.py' in os.listdir(os.getcwd()):
"    settings = os.path.split(os.getcwd())[1] + '.settings'
"    os.environ['DJANGO_SETTINGS_MODULE'] = settings
"EOF
" }}}
" Общие настройки {{{
set nocompatible                        "режим несовместимости с vi
set nobackup                            "не создавать файлы с резервной копией (filename.txt~)"
set noswapfile                          "не создавать свап файлы
set history=50                          "сохранять 50 строк в истории командной строки
set ruler                               "постоянно показывать позицию курсора
set incsearch                           "показывать первое совпадение при наборе шаблона
set nohlsearch                          "подсветка найденного
set autoindent                          "при начале новой строки, отступ копируется из предыдущей
set smartindent                         "включаем умные отступы (в частности, отступы перед {, }, # и тд
set ignorecase                          "игнорируем регистр символов при поиске
set smartcase                           "только если в нём нет заглавных букв
set background=dark                     "фон терминала - темный
set ttyfast                             "коннект с терминалом быстрый
set visualbell                          "мигаем вместо пищания
set showmatch                           "показываем открывающие и закрывающие скобки
set rulerformat=%(%l,%c\ %p%%%)         "формат строки состояния строка х столбец, сколько прочитано файла в %
set nowrap                              "не разрывать строку при подходе к краю экрана
set linebreak                           "перенос по словам, а не по буквам
set showbreak=>                         "символ, отображающий продолжение строки
set tabstop=4                           "количество пробелов в табуляции
set smarttab                            "вставляет табуляцию в начале строки размера shiftwidth
set shiftwidth=4                        "число пробелов, используемых при автоотступе
set expandtab                           "заменяем табуляции пробелами (use :retab dude)
"set t_Co=256                            "включаем поддержку 256 цветов
set wildmenu                            "красивое автодополнение
set wildmode=full                       "показать все совпадения
set whichwrap=<,>,[,],b,s               "не останавливаться курсору на конце строки
set autowrite                           "автоматом записывать изменения в файл при переходе к другому файлу
set encoding=utf8                       "кодировка по дефолту
set termencoding=utf8                   "Кодировка вывода на терминал
set fileencodings=utf8,cp1251,koi8r     "Возможные кодировки файлов (автоматическая перекодировка)
set showcmd showmode                    "показывать незавершенные команды и текущий режим
set splitbelow                          "новое окно появляется снизу
set splitright                          "новое окно появляется справа
set showmatch                           "подсветка совпадающих скобок
"set autochdir                           "текущий каталог всегда совпадает с содержимым активного окна
set showtabline=2                       "постоянно выводим строку с табами
set tpm=100                             "максимальное количество открытых табов
set noexrc                              "не читаем файл конфигурации из текущей директории
set list                                "отображаем табуляции и пробелы...
set listchars=tab:»\ ,trail:·,extends:>,precedes:< "настраиваем символы
set number                              "отображение номеров строк
set numberwidth=4                       "ширина колонки с номерами строк
set autoread                            "перечитывать файл при внешнем изменении
set backspace=indent,eol,start          "bs влияет на отступы,еол,при начале ввода
set clipboard=unnamed,autoselect,exclude:cons\|linux "общий буфер обмена
set confirm                             "спрашивать подтверждение выхода
set cursorline                          "выделять строку с курсором
set cursorcolumn                        "показывать колонку курсора
au WinLeave * set nocursorline nocursorcolumn "нужно для отображения колонки
au WinEnter * set cursorline cursorcolumn     "курсора только в текущем окне
"set noequalalways                      "не изменять размеры окон при {за|от}крытии
"set winfixwidth                        "не изменять размеры в ширину, даже по ^_
"set winfixheight                       "не изменять размеры в высоту, даже по ^_
set helplang=ru                         "язык справки по умолчанию
set laststatus=2                        "всегда показывать строку статуса
"set matchpairs=<:>,{:},[:],(:)          "пары символов, для перехода по %
set mouse=a                             "мышка будет работать во всех режимах
set scrolloff=3                         "скролим вверх или вниз за 2 строки от края
set sidescroll=1                        "скролим влево или за 2 строки от края
set sidescrolloff=4                     "скролим влево или за 2 строки от края
set tildeop                             "~ теперь оператор
let mapleader=","                       "leader-клавиша теперь запятая
set colorcolumn=69                      "колонка отделяет 70 символов
filetype plugin indent on               "обнаружение типа файла
syntax on                               "подсветка синтаксиса
"}}}
"{{{ Общие маппинги
" Maps Alt-[h,j,k,l] to resizing a window split
"map <silent> . <C-w><
"map <silent> , <C-w>>
"map <silent> m <C-W>-
"map <silent> n <C-W>+

" отключаем фишку smartindent, когда строка, начинающаяся с # пишется без отступов
inoremap # X#
" }}}
" Фолдинг {{{
" za - свернуть/развернуть блок
" zA - рекурсивно свернуть/развернуть блок
" zm - свернуть все
" zR - развернуть все
set foldenable                          "влючение фолдинга
"set foldclose=all                      "автозакрытие фолда при выходе из него
set foldcolumn=2                        "размер колонки с фолдами слева
set foldlevel=0                         "закрывать фолды с указанным уровнем (0-закрывать все)
set foldmethod=marker                   "фолды закрываются по маркеру
" }}}
" Настройки цветовой схемы и подсветки {{{
" {{{ zenburn
colorscheme zenburn
let g:zenburn_high_Contrast = 0         "отключим высокую контрастность
let g:zenburn_color_also_Ignore = 0     "игнорируем отображение пайпов
let g:zenburn_alternate_Visual = 1      "контрастное визуальное выделение
let g:zenburn_alternate_Error = 0       "альтернативная подсветка ошибок
let g:zenburn_alternate_Include = 0     "подсветка Include
let g:zenburn_force_dark_Background = 1 "темный бэкграунд принудительно
let g:zenburn_unified_CursorColumn = 0  "темная подсветка колонки курсора
highlight TabLineFill term=bold cterm=bold ctermbg=237
highlight TabLineSel term=bold cterm=bold ctermbg=235 ctermfg=144
highlight TabLine term=bold cterm=bold ctermbg=236 ctermfg=144
" }}}
" {{{ solarized
"set background=light
"colorscheme solarized
"let g:solarized_termcolors=256
" }}}
" подсветка скобок
au BufWinEnter * :source /home/jungo/.vim/bundle/rainbow-parenthesis/plugin/RainbowParenthsis.vim
" }}}
" Настройки автодополнения {{{
" any keyword:           CTRL-P CTRL-N
" whole-line:            CTRL-X CTRL-L
" dictionary:            CTRL-X CTRL-K
" included patterns:     CTRL-X CTRL-I
" tags:                  CTRL-X CTRL-]
" complete function:     CTRL-X CTRL-U
" omni function:         CTRL-X CTRL-O
" filenames:             CTRL-X CTRL-F
"set complete=.,t,w,b,u,k,kspell,s,i,d    "дополняем почти из всего чего можно
set complete=.,t,w,b,u,k,s,i,d    "дополняем почти из всего чего можно
set completeopt=menu,menuone,longest,preview "показывать меню и всё в нём
"set dictionary+=""                      "путь до файла-словаря
" }}}
" Настройки сессий {{{
set sessionoptions-=options
au VimLeavePre * silent :mksession! $HOME/.vim/sessions/last.vim
" }}}
" Разные функции {{{
" Переключение раскладок и индикация выбранной в данный момент раскладки {{{
function! MyKeyMapHighlight()
    if &iminsert == 0
        hi StatusLine ctermfg=236 ctermbg=144
    else
        hi StatusLine ctermfg=144 ctermbg=236
    endif
endfunction
" Вызываем функцию, чтобы она установила цвета при запуске Vim'a
call MyKeyMapHighlight()
" При изменении активного окна будет выполняться обновление индикации текущей раскладки
au WinEnter * :call MyKeyMapHighlight()
" }}}
" Устанавливает абсолютные или относительные номера строк {{{
function! NumbersToggle()
    if &number
        setlocal relativenumber
    else
        setlocal number
    endif
endfunction
" }}}
" Компиляция по F5, запуск по F9 {{{
" Запускает компиляцию в зависимости от наличия Makefile
" Спасибо, http://welinux.ru/post/3478/
function! BindF5_C()
    "http://habrahabr.ru/blogs/vim/40369/
    if filereadable("CMakeLists.txt")
        set makeprg=make
         map <F5>      :w<CR>:!cmake \.<CR>:make clean<CR>:make<CR>:cw<CR>
        imap <F5> <ESC>:w<CR>:!cmake \.<CR>:make clean<CR>:make<CR>:cw<CR>
    else
        if filereadable("Makefile")
            set makeprg=make
             map <F5>      :w<CR>:make clean<CR>:make<CR>:cw<CR>
            imap <F5> <ESC>:w<CR>:make clean<CR>:make<CR>:cw<CR>
        else
             map <F5>      :w<CR>:make %:r<CR>:cw<CR>
            imap <F5> <ESC>:w<CR>:make %:r<CR>:cw<CR>
        endif
    endif
endfunction
au FileType c,cc,cpp,h,hpp,s call BindF5_C()

function! BindF9_C()
    "http://habrahabr.ru/blogs/vim/40369/
    if filereadable("CMakeLists.txt")
        set makeprg=make
         map <F9>      :w<CR>:!cmake \.<CR>:make<CR>:cw<CR>:!clear & ./%<<CR>
        imap <F9> <ESC>:w<CR>:!cmake \.<CR>:make<CR>:cw<CR>:!clear & ./%<<CR>
    else
        if filereadable("Makefile")
            set makeprg=make
             map <F9>      :w<CR>:make<CR>:cw<CR>:!clear & ./%<<CR>
            imap <F9> <ESC>:w<CR>:make<CR>:cw<CR>:!clear & ./%<<CR>
        else
             map <F9>      :w<CR>:make %:r<CR>:cw<CR>:!clear & ./%<<CR>
            imap <F9> <ESC>:w<CR>:make %:r<CR>:cw<CR>:!clear & ./%<<CR>
        endif
    endif
endfunction
au FileType c,cc,cpp,h,hpp,s call BindF9_C()
" }}}
" }}}
" Русификация {{{
" Способ 1 (текущий) {{{
" Используется функция MyKeyMapHighlight и биндинг на Ctrl + F
set keymap=russian-jcukenwin    " настраиваем переключение раскладок клавиатуры по C-^
set iminsert=0                  " раскладка по умолчанию для ввода - английская
set imsearch=0                  " раскладка по умолчанию для поиска - английская
" }}}
" Способ 2 {{{
"set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>
" }}}
" }}}
" Статусная строка {{{
set statusline=%t                       "конец имени файла
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "кодировка файла
set statusline+=%{&ff}]                 "формат файла
set statusline+=%h                      "флажок хелпа
set statusline+=%m                      "флажок модификации файла
set statusline+=%r                      "флажок только на чтение
set statusline+=%y                      "тип файла
set statusline+=[%{strftime(\"%H:%M:%S\")}] "время
"set statusline+=\ %{fugitive#statusline()}  "git status
set statusline+=%=                      "разделитель на "лево" и "право"
set statusline+=%c,                     "колонка курсора
set statusline+=%l/%L                   "линия курсора / всего линий
set statusline+=\ %P                    "просмотрено в процентах

" }}}
" Подсветка символов {{{
"eol, extends, precedes
"hi NonText ctermfg=7 guifg=gray
"nbsp, tab, trail
hi SpecialKey ctermfg=darkgray
" Использовать эту подсветку для лишних пробелов и табов
highlight BadWhitespace ctermbg=darkred
" Отображать табы в начале строки как плохие
au BufRead,BufNewFile *.* match BadWhitespace /^\t\+/
" Отображать лишние пробелы как плохие
au BufRead,BufNewFile *.* match BadWhitespace /\s\+$/
" }}}
" Настройки для питона {{{
" http://svn.python.org/projects/python/trunk/Misc/Vim/vimrc
" Полная подсветка синтаксиса
let python_highlight_all=1
"au BufRead,BufNewFile *.py,*.pyw :TlistOpen
" автодополнение для питона и компании
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

" подсветка django html
au FileType html set filetype=htmldjango

" включаем pylint для питона
"autocmd FileType python compiler pylint
"
" Фолдинг, основанный на отступах
au BufRead,BufNewFile *.py,*.pyw set foldmethod=indent
"au BufRead,BufNewFile *.py,*.pyw set foldnestmax=2

" файлы jinja2 это та же jinja
au BufRead,BufNewFile *.jinja2 setfiletype jinja
" }}}
" Настройки для С/C++ {{{
au FileType c,cpp,h inoremap {<CR> {<CR>}<Esc>0ko
au FileType c,cpp,h inoremap #d #define 
au FileType c,cpp,h inoremap #i #include 
au FileType c,cpp,h inoremap #f /* FIXME:   */<Esc>hhhi
au FileType c,cpp,h inoremap #t /* TODO:   */<Esc>hhhi
au FileType c,cpp,h inoremap ;; <END>;<CR>
au FileType c,cpp,h source /home/jungo/.vim/bundle/vim-opengl/syntax/opengl.vim

" автоматически открывать окно автодополнения
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif

"a.vim - переключение между cpp и h файлами
map ga :A<CR>

" автоматически открывать TagList
"au Filetype c,cpp,h :TlistToggle
" }}}
" Настройки для набора текста {{{
au BufRead,BufNewFile *.txt setfiletype text
autocmd FileType text set wrap
autocmd FileType text set linebreak
autocmd FileType text set colorcolumn=""
autocmd FileType text set showbreak=""
"autocmd FileType text setlocal spell spelllang=ru_ru,en_us
autocmd FileType text set nonumber
autocmd FileType text set nocursorcolumn
"autocmd FileType text set textwidth=80
" }}}
" Горячие клавиши / настройки клавиатуры {{{
"переключение режима вставки
set pastetoggle=<F2>

"yстанавливает абсолютные или относительные номера строк
nmap<silent> <Leader>l :call NumbersToggle()<CR>

"переключение на русскую/английскую раскладку по ^f (Ctrl + F)
cmap <silent> <C-F> <C-^>
imap <silent> <C-F> <C-^>X<Esc>:call MyKeyMapHighlight()<CR>a<C-H>
nmap <silent> <C-F> a<C-^><Esc>:call MyKeyMapHighlight()<CR>
vmap <silent> <C-F> <Esc>a<C-^><Esc>:call MyKeyMapHighlight()<CR>gv

" показывает все FIXME, TODO (show fixes)
map sf :bufdo vimgrep /TODO\\|FIXME/gj %<CR>:cw<CR>
" ctags
map tc :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
" файлы с тегами
set tags+=./tags
set tags+=~/.vim/tags/cpp
set tags+=~/.vim/tags/gl
set tags+=~/.vim/tags/sdl
set tags+=~/.vim/tags/qt4
set tags+=~/.vim/tags/qt4_another
set tags+=~/.vim/tags/oil
set tags+=~/.vim/tags/opencv2
set tags+=~/.vim/tags/opencv
" taglist.vim - список тегов
map tg :TlistToggle<CR>
map tt :NERDTreeToggle<CR>

" сессии
map <F6> :source $HOME/.vim/sessions/last.vim<CR>
map <F7> :source $HOME/.vim/sessions/work.vim<CR>
map <F8> :mksession! $HOME/.vim/sessions/work.vim<CR>

" форматируем заголовок
"  ---------
"  заголовок
"  ---------
map ,,h :python format_header()
imap ,,h :python format_header()
" }}}
" Горячие клавиши для плагинов {{{
" некоторые маппинги оставлены по дефолту
" bufexplorer.vim {{{
" To start exploring in the current window, use:
map <Leader>be :BufExplorer
"To start exploring in a newly split horizontal window, use:
map <Leader>bs :BufExplorerHorizontalSplit
"To start exploring in a newly split vertical window, use:
map <Leader>bv :BufExplorerVerticalSplit
" }}}
" command-t.vim {{{
nmap <silent> <Leader>t :CommandT<CR>
nmap <silent> <Leader>b :CommandTBuffer<CR>
" }}}
" errormarker.vim {{{
nmap <silent> <unique> <Leader>ee :ErrorAtCursor<CR>
map <Leader>es :cn<CR>
map <Leader>eS :cp<CR>
" }}}
" snipmate.vim {{{
" use c-j instead of tab
"ino <c-j> <c-r>=TriggerSnippet()<cr>
"snor <c-j> <esc>i<right><c-r>=TriggerSnippet()<cr>
" }}}
" yankring.vim {{{
nnoremap <silent> sy :YRShow<CR>
" }}}
" pep8.vim {{{
"let g:pep8_map='<Leader>pp'
" }}}
" pylint {{{
map <Leader>pl :Pylint<CR>
" }}}
" }}}
" Плагины {{{
" autocomplpop.vim {{{
let g:acp_enableAtStartup = 1               "включить при старте системы
let g:acp_mappingDriven = 0                 "если 1 то будет включаться по хоткею
let g:acp_ignorecaseOption = 1              "игнорировать регистр
let g:acp_completeOption = '.,t,w,b,k'        "опции дополнения (completeopt)
let g:acp_completeoptPreview = 0            "показывать превью дополнения
let g:acp_behaviorKeywordCommand = "\<C-n>" "комманда для автодополнения
let g:acp_behaviorKeywordLength = 2         "количество символов для начала дополнения
let g:acp_behaviorKeywordIgnores = []       "не дополнять эти слова
" }}}
" bufexplorer.vim {{{
" дефолтные настройки достаточно хороши
let g:bufExplorerDetailedHelp=0      " показывать детальную помощь
let g:bufExplorerSplitOutPathName=1  " показывать путь и имя файла отдельно
let g:bufExplorerShowRelativePath=1  " показывать относительные пути
" }}}
" commant-t {{{
let g:CommandTMatchWindowAtTop = 0  "показывать окно поиска сверху, а не снизу
set wildignore+=*.o,*.obj,.git      "список для игнора
" }}}
" delimit-mate.vim {{{
let loaded_delimitMate = 1 "отключить этот плагин к такой то матери
" }}}
" errormarker.vim" {{{
" различие между ошибками и предупреждениями
let &errorformat="%f:%l:%c: %t%*[^:]:%m,%f:%l: %t%*[^:]:%m," . &errorformat
" для русского языка
set makeprg=LANGUAGE=C\ make
" отображаемый текст в левой колонке
let errormarker_errortext = "Er"
let errormarker_warningtext = "Wa"
" группы подсветки
let errormarker_errorgroup = "ErrorMsg"
let errormarker_warninggroup = "Todo"
hi ErrorMsg term=standout cterm=bold ctermfg=7 ctermbg=1
" типы ошибок, которые надо понимать как предупреждения
let errormarker_warningtypes = "wWiI"
" показать ошибку под курсором
" }}}
" mru.vim {{{
let MRU_File = '/home/jungo/.vim/.mru_files'    "список файлов
let MRU_Window_Height = 15                      "высота списка
let MRU_Auto_Close = 1                          "автозакрывать после выбора
" }}}
" nerd-tree.vim {{{
let NERDChristmasTree = 1
let NERDTreeBookmarksFile = '/home/jungo/.vim/.nerd_tree_bookmarks'
let NERDTreeQuitOnOpen = 1
let NERDTreeDirArrows = 1

" }}}
" supertab.vim {{{
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-o>"
let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover']
let g:SuperTabCompletionContexts = []
let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
let g:SuperTabContextDiscoverDiscovery =
    \ ["&completefunc:<c-x><c-u>", "&omnifunc:<c-x><c-o>"]
let g:SuperTabRetainCompletionDuration = "insert"
let g:SuperTabLongestEnhanced = 1
let g:SuperTabLongestHighlight = 1
" }}}
" taglist.vim {{{
let Tlist_Auto_Highlight_Tag = 1            "автоподсветка тегов
let Tlist_Auto_Open = 0                     "автооткрывать при старте
let Tlist_Auto_Update = 1                   "автообновление
let Tlist_Close_On_Select = 0               "закрывать при выборе тега
let Tlist_GainFocus_On_ToggleOpen = 1       "получать фокус при открытии
let Tlist_Compact_Format = 0                "компактный формат отображения
let Tlist_Display_Prototype = 0             "отображать прототипы
let Tlist_Display_Tag_Scope = 1             "отображать область видимости
let Tlist_Exit_OnlyWindow = 1               "закрывать вим, когда остался только теглист
let Tlist_File_Fold_Auto_Close = 1          "автозакрывать фолды для других файлов
let Tlist_Show_One_File = 0                 "показывать теги только текущего буффера
let Tlist_Process_File_Always = 1           "автообновлять список тегов даже если окно закрыто
let Tlist_Use_Right_Window = 1              "список тегов справа
let Tlist_WinWidth = 40                     "ширина окна
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
" }}}
" omnicppcomplete.vim {{{
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_NamespaceSearch = 1
let OmniCpp_DisplayMode = 0
let OmniCpp_ShowScopeInAbbr = 0
let OmniCpp_ShowPrototypeInAbbr = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"] 
let OmniCpp_MayCompleteDot = 1
let OmniCpp_MayCompleteArrow = 1
let OmniCpp_MayCompleteScope = 1
"let OmniCpp_SelectFirstItem = 1
let OmniCpp_LocalSearchDecl = 0
" }}}
" yankring.vim [uninstalled] {{{
let g:yankring_max_history = 1000
let g:yankring_dot_repeat_yank = 0      "если 1, то . повторяет копирование
let g:yankring_paste_using_g = 1        "создать привязки gp и gP (p и P)
let g:yankring_manage_numbered_reg = 0  "если 1, то поддерживать цифровые регистры [1p, 2p ...]
let g:yankring_history_dir = '/home/jungo/.vim/'
let g:yankring_history_file = '.yankring_history'
let g:yankring_window_increment = 50    "увеличить окно при нажатии пробела
" }}}
" pylint {{{
" если 0 то не вызывать pylint при сохранении файла
let g:pylint_onwrite = 0
" если 0 отключить отображение информации о рейтинге кода
let g:pylint_show_rate = 0
" если 0 не открывать окно quickfix
let g:pylint_cwindow = 1
" }}}
" pyflakes {{{
let g:pyflakes_use_quickfix = 0
" }}}
" pydoc {{{
" <Leader>pw - открыть справку по слову под курсором
" }}}
" ropevim {{{
" сейчас ropevim установлен через python2 setup.py install, поэтому
" он у меня в PYTHONPATH, но если он больше не заводится (например,
" при переустановке ОС, тогда можно (и даже нужно) использовать такой
" вот способ: добавить rope и ropevim в PYTHONPATH и просорсить
" ropevim.vim
"let $PYTHONPATH .= ":/home/jungo/.vim/rope:/home/jungo/.vim/bundle/ropevim"
"source /home/jungo/.vim/bundle/ropevim.vim
"source /usr/lib/python2.7/site-packages/ropevim-0.3_rc-py2.7.egg/ropevim.vim
" автодополнение по M-/ или M-? по дефолту
let ropevim_vim_completion=1
" показывать доп. информацию в дополнении
let ropevim_extended_complete=1
" без комментариев
let ropevim_enable_autoimport=1
" автоимпортировать эти модули
let g:ropevim_autoimport_modules = ["os", "shutil", "django"]
" если в ropevim еще не открыт проект, то попробовать угадать какой
" проект надо открыть и открыть его без вопросов
let ropevim_guess_project=1
" включить более короткие горячие клавиши
let ropevim_enable_shortcuts=1
" короткие горячие клавиши
"================  ============================
"Key               Command
"================  ============================
"M-/               RopeCodeAssist
"M-?               RopeLuckyAssist
"C-c g             RopeGotoDefinition
"C-c d             RopeShowDoc
"C-c f             RopeFindOccurrences
"================  ============================
"
" стандартные горячие клавиши:
"
"================  ============================
"Key               Command
"================  ============================
"C-x p o           RopeOpenProject
"C-x p k           RopeCloseProject
"C-x p f           RopeFindFile
"C-x p 4 f         RopeFindFileOtherWindow
"C-x p u           RopeUndo
"C-x p r           RopeRedo
"C-x p c           RopeProjectConfig
"C-x p n [mpfd]    RopeCreate(Module|Package|File|Directory)
                  "RopeWriteProject

"C-c r r           RopeRename
"C-c r l           RopeExtractVariable
"C-c r m           RopeExtractMethod
"C-c r i           RopeInline
"C-c r v           RopeMove
"C-c r x           RopeRestructure
"C-c r u           RopeUseFunction
"C-c r f           RopeIntroduceFactory
"C-c r s           RopeChangeSignature
"C-c r 1 r         RopeRenameCurrentModule
"C-c r 1 v         RopeMoveCurrentModule
"C-c r 1 p         RopeModuleToPackage

"C-c r o           RopeOrganizeImports
"C-c r n [vfcmp]   RopeGenerate(Variable|Function|Class|Module|Package)

"C-c r a /         RopeCodeAssist
"C-c r a g         RopeGotoDefinition
"C-c r a d         RopeShowDoc
"C-c r a f         RopeFindOccurrences
"C-c r a ?         RopeLuckyAssist
"C-c r a j         RopeJumpToGlobal
"C-c r a c         RopeShowCalltip
                  "RopeAnalyzeModule

                  "RopeAutoImport
                  "RopeGenerateAutoimportCache
"===============   ============================
" }}}
" }}}
