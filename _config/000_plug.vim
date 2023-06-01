if empty(globpath(&rtp, 'autoload/plug.vim'))
    "ctrlp.vimがインストールされていない場合は終了
    finish
endif

" プラグインの読み込み
let g:plug_shallow = 0
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'vim-skk/eskk.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mattn/ctrlp-matchfuzzy'
Plug 'mattn/vim-maketable'

" 参考:https://mattn.kaoriya.net/software/vim/20191231213507.htm
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'mattn/vim-lsp-icons'
call plug#end()

