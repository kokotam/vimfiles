if empty(globpath(&rtp, 'autoload/fugitive.vim'))
    "fugitive.vimがインストールされていない場合は終了
    finish
endif

set statusline+=%{fugitive#statusline()}  " ステータス行に現在のgitブランチを表示する

