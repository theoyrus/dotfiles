call plug#begin('~/.local/share/nvim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}

Plug 'honza/vim-snippets'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Vim move line
Plug 'matze/vim-move'

" Vim Lazygit
Plug 'kdheepak/lazygit.nvim', { 'branch': 'nvim-v0.4.3' }

Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'rakr/vim-one'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'wakatime/vim-wakatime'
Plug 'airblade/vim-gitgutter'
Plug 'sheerun/vim-polyglot'
Plug 'terryma/vim-multiple-cursors'
Plug 'nathanaelkane/vim-indent-guides'
" Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf', { 'dir': '~/opt/fzf', 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'fatih/vim-go'
Plug 'rust-lang/rust.vim'
Plug 'yuttie/comfortable-motion.vim'
Plug 'vimwiki/vimwiki'

Plug 'jiangmiao/auto-pairs'
Plug 'machakann/vim-highlightedyank'
Plug 'mhinz/vim-startify'
Plug 'alvan/vim-closetag'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'StanAngeloff/php.vim'
Plug 'mattn/emmet-vim'
Plug 'stephpy/vim-php-cs-fixer'
Plug 'shawncplus/phpcomplete.vim'
Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'
Plug 'dense-analysis/ale'
" Plug 'Shougo/deoplete.nvim'
" Plug 'zchee/deoplete-jedi'
Plug 'ap/vim-css-color'
Plug 'posva/vim-vue'
Plug 'leafgarland/typescript-vim'
Plug 'prettier/vim-prettier'
Plug 'Yggdroot/indentLine'

" Plug 'jooize/vim-colemak'

call plug#end()

let NERDTreeMinimalUI = 1
let NERDTreeIgnore=['__pycache__', 'node_modules']

let g:comfortable_motion_scroll_down_key = "j"
let g:comfortable_motion_scroll_up_key = "k"
let g:move_map_keys = 0
let g:prettier#autoformat = 0
let g:rustfmt_autosave = 1
let g:comfortable_motion_no_default_key_mappings = 1
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|build|dist)|(\.(swp|ico|git|svn))$'
let g:fzf_layout = { 'down': '~50%' }
let g:fzf_preview_window = 'right:60%' 
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

" move key modifier
let g:move_key_modifier = 'C'

if (has('termguicolors'))
 set termguicolors
endif

if (has('mouse'))
  set mouse=a
endif

set laststatus=0
set textwidth=100
set noruler
set incsearch
set hlsearch
set number
set spell
set formatoptions+=o
set autoindent
set cindent
set tabstop=2
set shiftwidth=2
set expandtab
set nojoinspaces

set cursorline
set background=dark
" set rtp+=/usr/local/opt/fzf
set rtp+=~/opt/fzf/
set clipboard=unnamedplus

colorscheme one

syntax enable
set encoding=utf8

filetype plugin indent on

cabbrev Reload so ~/.config/nvim/init.vim

highlight EndOfBuffer guifg=bg

autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.vue,*.yaml PrettierAsync

" Leader map key is space
nnoremap <SPACE> <Nop>
let mapleader      = " "
let maplocalleader = " "

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

xmap <C-_> gc<CR>
nmap <c-_> gc<CR>

nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

nnoremap <Leader>g :silent lgrep<Space>
nnoremap <silent> [f :lprevious<CR>
nnoremap <silent> ]f :lnext<CR>

" setup mapping to call :LazyGit
nnoremap <silent> <leader>lg :LazyGit<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COC Configs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap {<CR> {<CR>}<Esc>O<BS><Tab>
"COC Config
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)
" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'
" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)

" =====================================
" END coc config
" =====================================


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SPLIT
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" OPEN SPLITS
nmap vs :vsplit<cr>
nmap sp :split<cr>

" QUICK MOVE SPLIT NAVIGATION
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" Quick close buffers
nmap <C-x> :Bdelete<CR>

nnoremap <C-i> :IndentGuidesToggle<CR>
nnoremap <C-t> :tabnew<CR>
nnoremap <C-f> :Rg<CR>
nnoremap <C-p> :Files<CR>
nnoremap <C-c> :syntax sync fromstart<CR>
nnoremap <C-h> :noh<CR>
nnoremap <C-b> :NERDTreeToggle<CR>
nnoremap <C-a> <esc>ggVG$<CR>

nnoremap <silent> <S-j> :call comfortable_motion#flick(50)<CR>
nnoremap <silent> <S-k> :call comfortable_motion#flick(-50)<CR>

noremap <silent> <S-Up> :resize +3<CR>
noremap <silent> <S-Down> :resize -3<CR>

noremap <silent> <S-Right> :vertical resize +3<CR>
noremap <silent> <S-Left> :vertical resize -3<CR>

noremap <silent> <ScrollWheelDown> :call comfortable_motion#flick(50)<CR>
noremap <silent> <ScrollWheelUp>   :call comfortable_motion#flick(-50)<CR>

tnoremap <ESC><ESC> <C-\><C-N>

set autoread
au CursorHold * checktime
set updatetime=750

" Give more space for displaying messages.
set cmdheight=2

"css completion
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType scss set omnifunc=csscomplete#CompleteCSS

au BufNewFile, BufRead *.js, *.html, *.css
      \ set tabstop=2 |
      \ set softtabstop=2 |
      \ set shiftwidth=2

" PHP
function! PhpSyntaxOverride()
  hi! def link phpDocTags phpDefine
  hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxtOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END

" php-cs-fixer
let g:php_cs_fixer_rules = "@PSR2"
let g:php_cs_fixer_php_path="/usr/local/bin/php-cs-fixer"
let g:php_cs_fixer_enable_default_mapping = 1
let g:php_cs_fixer_dry_run = 0
let g:php_cs_fixer_verbose = 0

autocmd BufWritePost *.php silent! call PhpCsFixerFixFile()
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

" Dart file auto detection
au BufRead, BufNewFile *.dart set filetype=dart

" Deoplete
"""  let g:deoplete#enable_at_startup=1

" let g:ale_fixers = {
"       \'*': ['remove_trailing_lines'],
"       \'javascript': ['prettier'],
"       \}

" let g:ale_linters = {
"       \'javascript': ['eslint'],
"       \}

" let g:ale_completion_enabled=1
" let g:ale_fix_on_save=1

"<TAB>: completion
" inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "<TAB>"

"tabline
let g:tablineclosebutton=1

"Color picker
nmap <silent> <F5> :VCoolor<CR>
let g:vcoolor_custom_picker = 'zenity --title "Pilih Warna" --color-selection --show-palette '

"Emmet Tab
"imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
