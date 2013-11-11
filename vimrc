" Конфигурационный файл asyncee, 2013 {{{
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
au BufWinEnter * :source $HOME/.vim/bundle/rainbow-parenthesis/plugin/RainbowParenthsis.vim
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

" файлы jinja2 это та же jinja
au BufRead,BufNewFile *.jinja2 setfiletype jinja
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

" taglist.vim - список тегов
map <Leader>tt :NERDTreeToggle<CR>

" сессии
map <F6> :source $HOME/.vim/sessions/last.vim<CR>
map <F7> :source $HOME/.vim/sessions/work.vim<CR>
map <F8> :mksession! $HOME/.vim/sessions/work.vim<CR>

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
" nerd-tree.vim {{{
let NERDChristmasTree = 1
let NERDTreeBookmarksFile = '~/.vim/.nerd_tree_bookmarks'
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
" pylint {{{
" если 0 то не вызывать pylint при сохранении файла
let g:pylint_onwrite = 0
" если 0 отключить отображение информации о рейтинге кода
let g:pylint_show_rate = 0
" если 0 не открывать окно quickfix
let g:pylint_cwindow = 0
" }}}
" pyflakes {{{
let g:pyflakes_use_quickfix = 0
" }}}
" }}}
