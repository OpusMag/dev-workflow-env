# Neovim Commands

## File Operations
- `:q` - Quit Neovim
- `:w` - Save the current file
- `:wq` - Save and quit
- `:q!` - Quit without saving
- `:e <filename>` - Open a file
- `:w <filename>` - Save the file with a new name

## Window Management
- `:split` or `:sp` - Split the window horizontally
- `:vsplit` or `:vsp` - Split the window vertically
- `Ctrl-w w` - Switch between windows
- `Ctrl-w q` - Close the current window
- `Ctrl-w h` - Move to the left window
- `Ctrl-w j` - Move to the window below
- `Ctrl-w k` - Move to the window above
- `Ctrl-w l` - Move to the right window
- `Ctrl-w =` - Make all windows equal height & width
- `Ctrl-w +` - Increase window height
- `Ctrl-w -` - Decrease window height
- `Ctrl-w >` - Increase window width
- `Ctrl-w <` - Decrease window width

## Tab Management
- `:tabnew` - Open a new tab
- `gt` - Go to the next tab
- `gT` - Go to the previous tab
- `:tabclose` - Close the current tab
- `:tabonly` - Close all other tabs

## Buffer Management
- `:bnext` or `:bn` - Go to the next buffer
- `:bprev` or `:bp` - Go to the previous buffer
- `:bdelete` or `:bd` - Delete the current buffer
- `:ls` - List all buffers
- `:buffer <number>` - Switch to buffer by number

## Search and Replace
- `:noh` - Clear search highlighting
- `:set hlsearch` - Highlight search results
- `:set nohlsearch` - Do not highlight search results
- `:set incsearch` - Incremental search
- `:set noincsearch` - Disable incremental search
- `:set ignorecase` - Ignore case in search patterns
- `:set noignorecase` - Do not ignore case in search patterns
- `:set smartcase` - Override ignorecase if search pattern contains uppercase letters
- `:set nosmartcase` - Disable smartcase
- `:%s/old/new/g` - Replace all occurrences of 'old' with 'new' in the file
- `:%s/old/new/gc` - Replace all occurrences with confirmation

## Display Settings
- `:set number` or `:set nu` - Show line numbers
- `:set nonumber` or `:set nonu` - Hide line numbers
- `:set relativenumber` or `:set rnu` - Show relative line numbers
- `:set norelativenumber` or `:set nornu` - Hide relative line numbers
- `:set wrap` - Enable line wrapping
- `:set nowrap` - Disable line wrapping
- `:set cursorline` - Highlight the current line
- `:set nocursorline` - Do not highlight the current line
- `:set cursorcolumn` - Highlight the current column
- `:set nocursorcolumn` - Do not highlight the current column
- `:set list` - Show invisible characters
- `:set nolist` - Do not show invisible characters

## Spell Checking
- `:set spell` - Enable spell checking
- `:set nospell` - Disable spell checking

## Indentation
- `:set autoindent` - Enable automatic indentation
- `:set noautoindent` - Disable automatic indentation
- `:set smartindent` - Enable smart indentation
- `:set nosmartindent` - Disable smart indentation
- `:set expandtab` - Convert tabs to spaces
- `:set noexpandtab` - Use tabs instead of spaces
- `:set shiftwidth=<number>` - Set the number of spaces to use for each step of (auto)indent
- `:set tabstop=<number>` - Set the number of spaces that a tab counts for

## Miscellaneous
- `:set list` - Show invisible characters
- `:set nolist` - Do not show invisible characters
- `:set mouse=a` - Enable mouse support in all modes
- `:set mouse=` - Disable mouse support
