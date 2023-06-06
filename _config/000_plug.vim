if empty(globpath(&rtp, 'autoload/plug.vim'))
    "ctrlp.vimがインストールされていない場合は終了
    finish
endif

" プラグインの読み込み
let g:plug_shallow = 0
call plug#begin('~/.vim/plugged')

" Git関連
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" SKK
Plug 'vim-skk/eskk.vim'

" セレクター
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mattn/ctrlp-matchfuzzy'

" Markdown関連
Plug 'mattn/vim-maketable'
Plug 'previm/previm'
Plug 'tyru/open-browser.vim'

" Language Server Protcol
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'mattn/vim-lsp-icons'

" アウトライン
Plug 'preservim/tagbar'

call plug#end()

