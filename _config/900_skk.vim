if empty(globpath(&rtp, 'autoload/eskk.vim'))
    finish
endif

let g:eskk#directory = "~/.config/eskk"
let g:eskk#large_dictionary = {'path': "~/.config/eskk/SKK-JISYO.L", 'sorted': 1, 'encoding': 'euc-jp',}

