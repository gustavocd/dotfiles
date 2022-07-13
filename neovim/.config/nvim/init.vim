source $HOME/.config/nvim/vim-plug/plugins.vim
source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/keys/mappings.vim
" source $HOME/.config/nvim/themes/onedark.vim
source $HOME/.config/nvim/themes/gruvbox.vim
source $HOME/.config/nvim/themes/airline.vim
source $HOME/.config/nvim/plug-config/rnvimr.vim
source $HOME/.config/nvim/plug-config/fzf.vim
source $HOME/.config/nvim/plug-config/prettier.vim
source $HOME/.config/nvim/plug-config/rainbow.vim
source $HOME/.config/nvim/plug-config/signify.vim
source $HOME/.config/nvim/plug-config/lsp.vim
source $HOME/.config/nvim/plug-config/start-screen.vim
source $HOME/.config/nvim/keys/which-key.vim

lua require'plug-colorizer'
lua require'compe-config'

" LSP
lua require'lsp/gopls'
lua require'lsp/dockerls'
lua require'lsp/tsserver'
lua require'lsp/jsonls'
lua require'lsp/graphql'
lua require'lsp/cssls'

" Load gopls configuration
autocmd BufWritePre *.go lua goimports(1000)

