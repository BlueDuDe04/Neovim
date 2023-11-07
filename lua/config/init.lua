local function init()
    vim.g.mapleader = ' '
    vim.g.maplocalleader = ','

    require('config.gitsigns')
    require('config.lualine')
    require('config.nvim-tree')
    require('config.treesitter')
    require('config.telescope')
    require('config.lspconfig')
    require('config.cmp')
    require('config.lint')
    require('config.comment')
    require('config.dashboard')
    require('config.neotest')
    require('config.refactoring')
    require('config.neorg')
    require('config.colorizer')

    require('config.keymap')

    vim.o.nu = true
    vim.o.relativenumber = true
    vim.opt.fillchars:append { eob = " " }
    vim.opt.conceallevel = 2

    vim.o.tabstop = 4
    vim.o.softtabstop = 4
    vim.o.shiftwidth = 4
    vim.o.expandtab = true
    vim.o.splitbelow = true
    vim.o.splitright = true

    vim.o.wrap = false
    vim.o.scrolloff = 15

    vim.o.swapfile = false
    vim.o.backup = false
    vim.o.undodir = os.getenv("HOME") .. "/.vim/undodir"
    vim.o.undofile = true

    vim.o.hlsearch = false
    vim.o.incsearch = true

    vim.opt.clipboard = "unnamedplus"

    vim.cmd.colorscheme "tokyonight-night"

    vim.keymap.set("n", "<PageUp>", "<PageUp>zz")
    vim.keymap.set("n", "<PageDown>", "<PageDown>zz")

    -- vim.keymap.set("n", "<leader>y", "\"+y")
    -- vim.keymap.set("v", "<leader>y", "\"+y")

    vim.keymap.set("v", "<S-Down>", ":m '>+1<CR>gv=gv")
    vim.keymap.set("v", "<S-Up>", ":m '<-2<CR>gv=gv")

    vim.keymap.set('n', '<Leader>F', '<cmd>:NvimTreeToggle<cr>')

    -- vim.keymap.set('n', '<Leader>F', '<cmd>:NvimTreeFocus<cr>')

    vim.keymap.set('n', '<Leader>W', '<cmd>:WhichKey<cr>')

    vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
end

return {
    init = init,
}
