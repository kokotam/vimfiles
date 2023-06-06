if empty(globpath(&rtp, 'autoload/tagbar.vim'))
    "ctrlp.vimがインストールされていない場合は終了
    finish
endif

" Tabbarの表示/非表示
nmap <Leader>tt :TagbarToggle<CR>

" ステータスラインに現在の場所を表示
set statusline+=%{tagbar#currenttag('[%s]','','f','scoped-stl')}
