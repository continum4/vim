" ------------------------------------------------------------------------------x"
"
" Archivo: ~/.vimrc
" Descrip: Mi archivo personal de configuración de Vim
"
" Autor: Gregorio Espadas (@gespadas) <gregorio@gespadas.com> (base)
" Adecuaciones: @continum4
"
" Configuración base tomada tomada de https://github.com/gespadas/mis-configuraciones/blob/master/vimrc, gracias al 
" aporte de Gregorio Espadas.
"
" Notas: Cada opción viene acompañada con una breve descripción, recomiendo
" consultar la ayuda (:help mi-duda) para comprender a detalle la
" finalidad y alcance de cada una de ellas.
"
" Última fecha de modificación: 2014-08-15
"
" ------------------------------------------------------------------------------

filetype plugin on                " Habilitar la detección del tipo de archivo
syntax enable                     " Habilitar el resaltado de sintaxis

set t_Co=256

if &term =~? 'linux'              " Si se usa TTY, entonces:
    set t_Co=16                   " - Establecer 16 colores
endif                             " Fin Si

colorscheme herald                " Habilitar el tema de colores

hi LineNr ctermfg=white ctermbg=24

" ------------------------------------------------------------------------------
" Fuente:   Terminus
" Enlace:   http://terminus-font.sourceforge.net/
" Paquete:  terminus-font (disponible en [community] de ArchLinux)
" Nota:     Esta configuración sólo aplica para Gvim. Para establecer Terminus
"           como la fuente para Vim en:
"           - URxvt » Usar ~/.Xresources.
"           - TTY   » Usar /etc/vconsole.conf
" ------------------------------------------------------------------------------

if has("gui_running")
  if has("gui_gtk2")
    set guifont=Terminus\ 18
  elseif has("gui_photon")
    set guifont=Terminus:s18
  elseif has("gui_kde")
    set guifont=Terminus/18/-1/5/50/0/0/0/1/0
  elseif has("x11")
    set guifont=-*-terminus-medium-r-normal-*-*-180-*-*-m-*-*
  else
    set guifont=Terminus:h18:cDEFAULT
  endif
endif


" ------------------------------------------------------------------------------
" Configuración del comportamiento general de Vim
" ------------------------------------------------------------------------------

set nocompatible                  " No usar la vieja configuración de vi
set encoding=utf-8                " Establecer la codificación de texto
set modelines=0                   " Prevención de agujeros de seguridad
set wildignorecase                " Completado de archivos 'case-insensitive'
set autoread                      " Recargar archivo si ha cambiado externamente
set scrolloff=1                   " Margen de líneas en desplazamiento vertical
set showmode                      " Mostrar el modo actual en la parte inferior
set showcmd                       " Mostrar comandos parciales en parte inferior
set hidden                        " No libera los buffers que no estén visibles
set wildmenu                      " Mejor completado en la línea de comandos
set wildmode=full                 " Tipo de completado en la línea de comandos
set visualbell                    " Usar una alerta visual en vez del 'beep'
set ttyfast                       " Mejor renderizado de texto en TTY
set ruler                         " Mostrar línea y columna del cursor
set laststatus=2                  " Siempre mostrar línea de estado en ventanas
set number                        " Mostrar número de líneas
set undofile                      " Habilita el 'deshacer' persistente 
set splitbelow                    " Nuevas ventanas abajo de la actual
set splitright                    " Nuevas ventanas a la derecha de la actual
set mouse=a                       " Soporte completo para el mouse
set clipboard=unnamedplus         " Registro '+' como alias del registro unnamed
set history=100                   " Cantidad de elementos en el historial
set cursorline

if has("statusline")
    set statusline=%<%f\ %h%m%r%=%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}%k\ %-14.(%l,%c%V%)\ %P
endif

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
"let g:airline_theme = 'laederon'
let g:Powerline_symbols = 'fancy'
 
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0" 

" ------------------------------------------------------------------------------
" Configuración de las tabulaciones e indentación
" ------------------------------------------------------------------------------

filetype indent on                " Indentación dependiente del lenguaje
set backspace=indent,eol,start    " Comportamiento de la tecla retroceso
set smartindent                   " Indentación inteligente
set autoindent                    " Indentación automática
set tabstop=4                     " Espacios usados por <Tab>
set shiftwidth=4                  " Espacios usados por la auto indentación
set softtabstop=4                 " Espacios contados por <Tab> en ediciones
"set expandtab                    " Usa espacios en lugar de <Tab>s


" ------------------------------------------------------------------------------
" Configuración de líneas largas
" ------------------------------------------------------------------------------

set nowrap           " Ajuste de línea dinámico (no modifica el texto)
set textwidth=0      " Ancho máximo del texto al escribir (modifica el texto)
set wrapmargin=0     " Margen en caracteres en el extremo derecho de la ventana
set formatoptions=ro " Inserta la marca de comentario luego de <CR> y o/O
set colorcolumn=120  " Muestra una columna coloreada en la posición indicada


" ------------------------------------------------------------------------------
" Opciones de búsquedas
" ------------------------------------------------------------------------------

set ignorecase       " Búsquedas 'case-insensitive'
set smartcase        " Ignora lo anterior si en patrón de búsqueda hay mayśculas
set incsearch        " Muestra el resultado de la búsqueda mientras se escribe
set showmatch        " Muestra la pareja de paréntesis, llaves o brackets
set hlsearch         " Habilita el resaltado de texto en las búsquedas


" ------------------------------------------------------------------------------
" Mapeos de acciones de uso frecuente
" ------------------------------------------------------------------------------

" Cambiando la tecla <leader> (el valor predeterminado es '\')
let mapleader = ","

" Crea un nuevo buffer (vacío, sin nombre)
nmap <leader>n :enew<cr>

" Guarda fácilmente el buffer actual
nmap <leader>w :write<cr>

" Cerrar fácilmente el buffer actual, guardando los cambios previamente
map <leader>d :write<cr>:bdelete<cr>

" Comando only
map <leader>z :only<cr>

" Toggle NERDTree
map <F12> :NERDTreeToggle<CR>

" Salir de vim fácilmente, guardando los cambios en todos los buffers abiertos
nmap <leader>q :wall<cr>:quit<cr>

" Guardar cambios
nmap <leader>s :write<cr>

" Salir de modo edición
imap jj <esc>

" Descarta fácilmente el resaltado luego de una búsqueda.
nnoremap <leader><space> :nohlsearch<CR> 

" Oculta y muestra (alterna) el resaltado luego de una búsqueda
nnoremap <F3> :set hlsearch!<CR>

" Elimina palabras duplicadas en todo el buffer actual
nmap <leader>x :%s/\v<(\w+)\_s+\1>/\1/<CR>

" Busca el texto seleccionado
xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>

" Cambiar al siguiente buffer con <Tab>, guardando el buffer si tiene cambios
nnoremap <silent>   <tab> :if &ma && !&ro && &mod <CR> :w<CR> :endif<CR>:bn<CR>
nnoremap <silent> <s-tab> :if &ma && !&ro && &mod <CR> :w<CR> :endif<CR>:bp<CR>

" Atajo (para la línea de comandos) de la ruta (directorio) del buffer actual
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Tratar las líneas largas (con ajuste dinámico) como líneas reales
map j gj
map k gk

" Moverse fácilmente entre ventanas 
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l


" ------------------------------------------------------------------------------
" Rutas para buscar archivos con :find y :vimgrep
" ------------------------------------------------------------------------------

set path+=/srv/http/**
set path+=~/.config/openbox/**


" ------------------------------------------------------------------------------
" Abreviaciones
" ------------------------------------------------------------------------------

" Abreviaciones para HTML
" iab <a <a href="" title=""></a><ESC>4F"a<C-R>=Eatchar('\s')<CR>
" iab img <img src="" alt="" /><ESC>4F"a<C-R>=Eatchar('\s')<CR>
" iab <p <p></p><ESC>3hi<C-R>=Eatchar('\s')<CR>
iab alt= alt=""<ESC>i<C-R>=Eatchar('\s')<CR>
iab class= class=""<ESC>i<C-R>=Eatchar('\s')<CR>
iab colspan= colspan=""<ESC>i<C-R>=Eatchar('\s')<CR>
iab href= href=""<ESC>i<C-R>=Eatchar('\s')<CR>
iab id= id=""<ESC>i<C-R>=Eatchar('\s')<CR>
iab name= name=""<ESC>i<C-R>=Eatchar('\s')<CR>
iab rel= rel=""<ESC>i<C-R>=Eatchar('\s')<CR>
iab src= src=""<ESC>i<C-R>=Eatchar('\s')<CR>
iab style= style=""<ESC>i<C-R>=Eatchar('\s')<CR>
iab target= target=""<ESC>i<C-R>=Eatchar('\s')<CR>
iab title= title=""<ESC>i<C-R>=Eatchar('\s')<CR>
iab type= type=""<ESC>i<C-R>=Eatchar('\s')<CR>
iab placeholder= placeholder=""<ESC>i<C-R>=Eatchar('\s')<CR>
iab value= value=""<ESC>i<C-R>=Eatchar('\s')<CR>
iab readonly= readonly="readonly"<ESC>i<C-R>=Eatchar('\s')<CR>
iab selected= selected="selected"<ESC>i<C-R>=Eatchar('\s')<CR>
iab disabled= disabled="disabled"<ESC>i<C-R>=Eatchar('\s')<CR>
iab typeb= type="button"
iab typeh= type="hidden"
iab types= type="submit"
iab typet= type="text"
iab ` ``<ESC>i<C-R>=Eatchar('\s')<CR>

" Abreviaciones para PHP y HTML
iab /** /**<CR><CR><BS>/<Up><Space>

" ------------------------------------------------------------------------------
" Plugins
" ------------------------------------------------------------------------------

" Pathogen - https://github.com/tpope/vim-pathogen
execute pathogen#infect()

" Emmet configuration
let g:user_emmet_mode='n'    "only enable normal mode functions.
let g:user_emmet_mode='inv'  "enable all functions, which is equal to
let g:user_emmet_mode='a'    "enable all function in all mode.

" ------------------------------------------------------------------------------
" Funciones personalizadas
" ------------------------------------------------------------------------------

function! s:VSetSearch()
    let temp = @s
    norm! gv"sy
    let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
    let @s = temp
endfunction

function! Eatchar(pat)
  let c = nr2char(getchar(0))
  return (c =~ a:pat) ? '' : c
endfunc
