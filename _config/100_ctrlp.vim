if empty(globpath(&rtp, 'autoload/ctrlp.vim'))
    "ctrlp.vimがインストールされていない場合は終了
    finish
endif

nnoremap <Leader>fb :<C-u>CtrlPBuffer<CR>
nnoremap <Leader>fd :<C-u>CtrlPDir<CR>
nnoremap <Leader>ff :<C-u>CtrlP<CR>
nnoremap <C-s> :<C-u>CtrlPLine<CR>
nnoremap <Leader>fr :<C-u>CtrlPMRUFiles<CR>
nnoremap <Leader>fq :<C-u>CtrlPQuickfix<CR>
nnoremap <Leader>ft :<C-u>CtrlPTag<CR>

" Guess vcs root dir
let g:ctrlp_working_path_mode = 'ra'
" Open new file in current window
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_extensions = ['tag', 'quickfix', 'dir', 'line', 'mixed']
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:18'
let g:ctrlp_root_markers = ['compile_flags.txt','.vim-lsp-settings/', '.git/']


let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|node_modules)$',
  \ 'file': '\v\.(exe|so|dll|tmp|vspscc|vssscc|obj|pdb|meta|pgc|pgd|log)$'
  \}

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

if !empty(globpath(&rtp, 'autoload/ctrlp_matchfuzzy.vim'))
    "ctrlp_matchfuzzyがインストールされている場合はそちらを使う
    let g:ctrlp_match_func = {'match': 'ctrlp_matchfuzzy#matcher'}
endif

