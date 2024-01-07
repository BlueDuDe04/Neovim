local function init()
    vim.g.mapleader = ' '
    vim.g.maplocalleader = ','

    require('config.gitsigns')
    require('config.lualine')
    -- require('config.nvim-tree')
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
    require('config.ufo')

    require('config.keymap')

    require('tokyonight').setup({
        style = "night",
        transparent = true,
        styles = {
            comments = {
                italic = false,
                bold = true,
            },
            keywords = {
                italic = true,
                bold = false,
            },
            functions = {
                italic = false,
                bold = true,
            },
            variables = {
                italic = false,
                bold = false,
            },
        },
    })

    require("oil").setup()
    vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

    require('leap').create_default_mappings()

    vim.o.nu = true
    vim.o.relativenumber = true
    vim.opt.fillchars:append { eob = " " }
    vim.opt.conceallevel = 2
    vim.o.ignorecase = true
    vim.o.termguicolors = true

    vim.o.tabstop = 4
    vim.o.softtabstop = 4
    vim.o.shiftwidth = 4
    vim.o.expandtab = true

    vim.opt.virtualedit = "block"

    vim.o.inccommand = "split"
    vim.o.splitbelow = true
    vim.o.splitright = true

    vim.o.foldcolumn = '0'
    vim.o.foldlevel = 99
    vim.o.foldlevelstart = 99
    -- vim.o.foldminlines = 10

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

    vim.keymap.set("v", "<S-Down>", ":m '>+1<CR>gv=gv")
    vim.keymap.set("v", "<S-Up>", ":m '<-2<CR>gv=gv")

    vim.keymap.set('n', '<leader>T', '<cmd>:NvimTreeToggle<cr>')
    vim.keymap.set('n', '<leader>F', '<cmd>:NvimTreeFocus<cr>')

    vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
end

return {
    init = init,
}
