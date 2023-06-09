" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

set runtimepath+=~/vimfiles,~/vimfiles/after

""""""""""""""""""""""""""""""""""""""""""""
" 各種オプションの設定
""""""""""""""""""""""""""""""""""""""""""""
" Leaderの設定
let mapleader = "\<Space>"

" veep音を止める
set visualbell t_vb=

""""""""""""""""""""""""""""""""""""""""""""
" 表示関連
""""""""""""""""""""""""""""""""""""""""""""
"シンタックスハイライトをONにする
syntax on

" colorschemeの変更
colorscheme torte 

" カーソルタイプの変更
let &t_SI .= "\e[6 q"  " 挿入モード: 非点滅の縦棒タイプ
let &t_EI .= "\e[2 q"  " ノーマルモード: 非点滅のブロックタイプ
let &t_SR .= "\e[4 q"  " 置換モード: 非点滅の下線タイプ

"encodeおよび改行コード
set fileencodings=utf-8,iso-2022-jp,cp932,euc-jp,utf-16le,utf-16
set fileformats=unix,dos,mac

set number         " 行番号を表示する
set cmdheight=1    " メッセージ表示欄を1行確保
set showmatch      " 対応する括弧を強調表示
set ruler          " カーソルの位置表示を行う
set cursorline     " 行を強調表示

" Status lineに候補を表示する
set wildmenu

"不可視文字の表示
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%

" statusバーの表示形式
set laststatus=2   " ステータス行を常に表示
set statusline=%F " ファイル名表示
set statusline+=%m " 変更チェック表
set statusline+=%r " 読み込み専用かどうか表示
set statusline+=%h " ヘルプページなら[HELP]と表示
set statusline+=%w " プレビューウインドウなら[Prevew]と表示
set statusline+=%= " これ以降は右寄せ表示
set statusline+=[ENC=%{&fileencoding}] " file encoding
set statusline+=[LOW=%l/%L] " 現在行数/全行数


"""""""""""""""""""""""""""""""""""""""""""""""
" キーバインド
"""""""""""""""""""""""""""""""""""""""""""""""
" 挿入モード中はemacsライクのキーバインドにする
" https://uguisu.skr.jp/Windows/vim.html
" 消去、編集
imap <C-k> <ESC>d$i
imap <C-y> <ESC>pi
imap <C-d> <ESC>xi

" 移動
imap <C-a>  <Home>
imap <C-e>  <End>
imap <C-b>  <Left>
imap <C-f>  <Right>

" quickfix
nnoremap <Leader>co :silent copen<CR>
nnoremap <Leader>cc :silent cclose<CR>
nnoremap <Leader>cn :silent cnext<CR>
nnoremap <Leader>cp :silent cprevious<CR>

" 削除時にyankしない
nnoremap x "_x
nnoremap s "_s
nnoremap c "_c

""""""""""""""""""""""""""""""""""""""""""""""" 
" ファイル処理関連の設定
"""""""""""""""""""""""""""""""""""""""""""""""
set confirm    " 保存されていないファイルがあるときは終了前に保存確認
set hidden     " 保存されていないファイルがあるときでも別のファイルを開くことが出来る

" undo履歴の設定
if has("persistent_undo")
	set undofile                " 可能なら undo 履歴を永続的に保存する
	set undodir=~/.vim_undo     " undoファイルを.vim_undoににまとめる
	if !isdirectory(&undodir)       " ディレクトリがなかったら作成する
		call mkdir(&undodir, "p")
	endif
endif

" バックアップファイルの設定
set backupdir=~/.vim_backup     " ~xxxを.vim_backupにまとめる
if !isdirectory(&backupdir)     " ディレクトリがなかったら作成する
	call mkdir(&backupdir, "p")
endif

" スワップファイルの設定
set directory=~/.vim_swapfile       " .xxx.swpを.vim_swapfileにまとめる
if !isdirectory(&directory)     " ディレクトリがなかったら作成する
	call mkdir(&directory, "p")
endif

"""""""""""""""""""""""""""""""""""""""""""""""
" タブ/インデントの設定
"""""""""""""""""""""""""""""""""""""""""""""""
"モードによってインデントの切り替えを許可する
filetype plugin indent on

"基本はautoindent
set autoindent

"shiftwidthを有効化
set smarttab

"タブ幅の設定
set expandtab
set tabstop=4 "自動で挿入されるインデントのスペース幅
set softtabstop=4 "tabキーを押した時に挿入されるスペース量
set shiftwidth=4 "自動で挿入されるインデントのスペース幅

"""""""""""""""""""""""""""""""""""""""""""""""
" 検索置換関連
"""""""""""""""""""""""""""""""""""""""""""""""
set wrapscan   " 最後尾まで検索を終えたら次の検索で先頭に移る
set smartcase " 大文字と小文字が混在した言葉で検索を行った場合に限り、大文字と小文字を区別する
set hlsearch " 検索文字列をハイライトする
set incsearch  " インクリメンタルサーチを行う


if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
else
  set grepprg=grep\ -rnIH\ --exclude-dir=.svn\ --exclude-dir=.git
endif

nnoremap <Leader>ss :silent grep! "\b\s?<C-R><C-W>\b"<CR>:cw<CR>:redr!<CR>

"""""""""""""""""""""""""""""""""""""""""""""""
" 動作環境との統合関連の設定
"""""""""""""""""""""""""""""""""""""""""""""""
" osのクリップボードをレジスタ指定無しで yank, put 出来るようにする
set clipboard=unnamed,unnamedplus
" マウスの入力を受け付ける
set mouse=a
" windows でもパスの区切り文字を / にする
set shellslash

" Windows の場合は必要なパスを追加しておく
if has('win32')
  let $PATH='c:\Program Files\Java\jdk1.8.0_221\bin;c:\mingw64\bin;c:\msys64\usr\bin;'.$PATH
  set shell=powershell.exe
endif

"""""""""""""""""""""""""""""""""""""""""""""""
" タグジャンプ関連
"""""""""""""""""""""""""""""""""""""""""""""""
" タグファイルの場所
set tags=./tags;,tags;
" 候補が複数ある場合は一覧を出す
nnoremap <C-]> g<C-]>

"""""""""""""""""""""""""""""""""""""""""""""""
" その他
"""""""""""""""""""""""""""""""""""""""""""""""

" TERMデバッガ
packadd termdebug
let g:termdebug_wide = 163 " 縦に分割

" カレントディレクトリの自動移動
set autochdir

"""""""""""""""""""""""""""""""""""""""""""""""
" 各種設定の読み込み
"""""""""""""""""""""""""""""""""""""""""""""""
call map(sort(split(globpath(&runtimepath, '_config/*.vim'))), {->[execute('exec "so" v:val')]})

