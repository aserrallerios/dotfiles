" Vim-Plug Plugins
call plug#begin('~/.vim/plugged')
Plug 'altercation/vim-colors-solarized'
"Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'bling/vim-bufferline'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'edkolev/tmuxline.vim'
Plug 'fatih/vim-go'
Plug 'nanotech/jellybeans.vim'
Plug 'rust-lang/rust.vim'
Plug 'scrooloose/nerdcommenter'
"Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
"Plug 'majutsushi/tagbar'
Plug 'w0rp/ale'

Plug 'tpope/vim-sensible'   " being merged into nvim default soon
Plug 'sjl/badwolf'          " colorscheme
Plug 'nathanaelkane/vim-indent-guides', {'for': ['html', 'htmldjango']}
Plug 'blueyed/vim-tmux-navigator'

Plug 'vim-scripts/AutoTag', {'on': 'TagbarToggle'}
Plug 'majutsushi/tagbar' ", {'on': 'TagbarToggle'}

Plug 'bling/vim-airline'

Plug 'scrooloose/syntastic', {'for' : ['sh', 'bash']}

Plug 'MarcWeber/vim-addon-mw-utils'  ", {'for' : ['python', 'ruby', 'html', 'css']}
Plug 'tomtom/tlib_vim', {'for' : ['python', 'ruby', 'html', 'css']}
Plug 'klen/python-mode', {'for' : 'python'}
Plug 'scrooloose/nerdtree' ", {'on': 'NERDTreeToggle'}
Plug 'tpope/vim-commentary'
"
Plug 'honza/vim-snippets'  ", {'for' : ['python', 'ruby', 'html', 'htmldjango', 'css']}
Plug 'SirVer/ultisnips'
"Plug 'garbas/vim-snipmate'  ", {'for' : ['python', 'ruby', 'html', 'css']}

Plug 'mileszs/ack.vim'

Plug 'dahu/vimple', {'for' : 'asciidoc'}
Plug 'dahu/Asif', {'for' : 'asciidoc'}
Plug 'vim-scripts/SyntaxRange', {'for' : 'asciidoc'}
Plug 'dahu/vim-asciidoc', {'for' : 'asciidoc'}
Plug 'vim-voom/VOoM', {'for' : ['markdown', 'asciidoc']}

Plug 'jamessan/vim-gnupg'
Plug 'chriskempson/base16-vim'

Plug 'kchmck/vim-coffee-script'

call plug#end()

#https://github.com/Grazfather/dotfiles/blob/master/vimrc
#https://github.com/sethwoodworth/dotfiles/blob/debian-9/.nvimrc