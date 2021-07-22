let g:startify_session_dir = '~/.config/nvim/session'

let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   Files']            },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
\ ]

let g:startify_bookmarks = [
            \ { 'i': '~/.config/nvim/init.vim' },
            \ { 'z': '~/.zshrc' },
            \ '~/go/src/github.com/gustavocd',
            \ '~/code',
            \ '~/Downloads',
\ ]

let g:startify_session_autoload = 1
let g:startify_session_delete_buffers = 1
let g:startify_change_to_vcs_root = 1
let g:startify_fortune_use_unicode = 1
let g:startify_session_persistence = 1
let g:startify_enable_special = 0

let g:startify_custom_header = [
        \ '   ______         __   ______          __          ',
        \ '  / ____/________/ /  / ____/___  ____/ /__  _____ ',
        \ ' / / __/ ___/ __  /  / /   / __ \/ __  / _ \/ ___/ ',
        \ '/ /_/ / /__/ /_/ /  / /___/ /_/ / /_/ /  __/ /     ',
        \ '\____/\___/\__,_/   \____/\____/\__,_/\___/_/      ',
\ ]
                                                  

