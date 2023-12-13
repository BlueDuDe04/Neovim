local bind = vim.keymap.set

-- LSP
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local lspBuf = vim.lsp.buf
    local opts = { buffer = ev.buf }
    bind('n', 'gD', lspBuf.declaration, opts)
    bind('n', 'gd', lspBuf.definition, opts)
    bind('n', 'K', lspBuf.hover, opts)
    bind('n', 'gi', lspBuf.implementation, opts)
    bind('n', '<C-k>', lspBuf.signature_help, opts)
    bind('n', '<leader>wa', lspBuf.add_workspace_folder, opts)
    bind('n', '<leader>wr', lspBuf.remove_workspace_folder, opts)
    bind('n', '<leader>wl', function() print(vim.inspect(lspBuf.list_workspace_folders())) end, opts)
    bind('n', '<leader>D', lspBuf.type_definition, opts)
    bind('n', '<leader>rn', lspBuf.rename, opts)
    bind({ 'n', 'v' }, '<leader>ca', lspBuf.code_action, opts)
    bind('n', 'gr', lspBuf.references, opts)
    bind('n', '<leader>f', function() lspBuf.format { async = true } end, opts)
  end,
})

-- Telescope
local telescope = require('telescope.builtin')
bind('n', '<leader>fg', telescope.git_files, { desc = '[F]ind [G]it files' })
bind('n', '<leader>ff', telescope.find_files, { desc = '[F]ind [F]iles' })
bind('n', '<leader>fb', telescope.buffers, { desc = '[F]ind [B]uffers' })
bind('n', '<leader>fh', telescope.help_tags, { desc = '[F]ind [H]elp' })
bind('n', '<leader>fw', telescope.grep_string, { desc = '[F]ind current [W]ord' })
bind('n', '<leader>fG', telescope.live_grep, { desc = '[F]ind by [G]rep' })
bind('n', '<leader>fd', telescope.diagnostics, { desc = '[F]ind [D]iagnostics' })
bind('n', '<leader>fr', telescope.resume, { desc = '[F]ind [R]esume' })
bind('n', '<leader>fj', telescope.jumplist, { desc = '[F]ind previous [J]umps' })

bind({ 'n', 'x' }, '<leader>rr', function() require('telescope').extensions.refactoring.refactors() end)

bind('n', '<leader>gw', function() require('telescope').extensions.git_worktree.git_worktree() end, {})
bind('n', '<leader>gc', function() require('telescope').extensions.git_worktree.create_git_worktree() end, {})

-- Neotest
local neotest = require('neotest')
bind('n', '<leader>tt', function() neotest.run.run() end)
bind('n', '<leader>ta', function() neotest.run.run(vim.fn.expand('%')) end)
bind('n', '<leader>ts', function() neotest.summary.toggle() end)
bind('n', '<leader>to', function() neotest.output.open() end)
bind('n', '<leader>tO', function() neotest.output_panel.toggle() end)
bind('n', '<leader>tn', function() neotest.jump.next() end)
bind('n', '<leader>tp', function() neotest.jump.prev() end)

-- Refactor
local refactor = require('refactoring').refactor
bind(--[[ only: visual ]] 'x', '<leader>rf', function() refactor('Extract Function') end)
bind(--[[ only: visual ]] 'x', '<leader>rF', function() refactor('Extract Function To File') end)
bind(--[[ only: visual ]] 'x', '<leader>rv', function() refactor('Extract Variable') end)
bind(--[[ only: normal ]] 'n', '<leader>r2', function() refactor('Inline Function') end)
bind({ 'n', 'x' }, '<leader>ri', function() refactor('Inline Variable') end)
bind(--[[ only: normal ]] 'n', '<leader>rb', function() refactor('Extract Block') end)
bind(--[[ only: normal ]] 'n', '<leader>rB', function() refactor('Extract Block To File') end)

-- ClipBoard
bind('n', '<leader>ps', function() vim.cmd.normal('a' .. vim.fn.system('cliphist list | sed -n 2p | cliphist decode')) end)
bind('n', '<leader>pt', function() vim.cmd.normal('a' .. vim.fn.system('cliphist list | sed -n 3p | cliphist decode')) end)
bind('n', '<leader>pn', function() vim.cmd.normal('a' .. vim.fn.system('cliphist list | sed -n 4p | cliphist decode')) end)
bind("n", "<leader>pe", function() vim.cmd.normal('a' .. vim.fn.system('cliphist list | sed -n 5p | cliphist decode')) end)

-- Harpoon
local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

bind("n", "<leader>a", function() harpoon:list():append() end)
bind("n", "<leader>l", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

bind("n", "<leader>0", function() harpoon:list():select(1) end)
bind("n", "<leader>1", function() harpoon:list():select(2) end)
bind("n", "<leader>2", function() harpoon:list():select(3) end)
bind("n", "<leader>3", function() harpoon:list():select(4) end)
bind("n", "<leader>4", function() harpoon:list():select(5) end)
bind("n", "<leader>5", function() harpoon:list():select(6) end)
bind("n", "<leader>6", function() harpoon:list():select(7) end)
bind("n", "<leader>7", function() harpoon:list():select(8) end)
bind("n", "<leader>8", function() harpoon:list():select(9) end)
bind("n", "<leader>9", function() harpoon:list():select(10) end)
