{
  description = "My Neovim Flake";

  outputs = { self, nixpkgs, flake-utils, ... }@inputs:
    flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = (import ./nix/pkgs.nix) inputs system;
    in {
      packages.default = (import ./nix) pkgs {
       load = with pkgs.vimPlugins; [
          (pkgs.vimUtils.buildVimPlugin { name = "config"; src = ./.; })

          nvim-treesitter.withAllGrammars
          telescope-fzf-native-nvim
        ];

        lazy = with pkgs.vimPlugins; [];

        deps = with pkgs; [
          ripgrep
          fd

          # LSPs
          rust-analyzer
          gopls
          zls
          lua-language-server
          nodePackages.typescript-language-server
          haskell-language-server
          rnix-lsp
          nil
          python311Packages.python-lsp-server
          glslls

          # Formatters
          rustfmt
          gofumpt
          golines
          nixpkgs-fmt
        ];
      };
    }
  );

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    flake-utils.url = "github:numtide/flake-utils";

    ### Neovim ###

    ##- Theme -##
    Load_tokyonight.url = "github:folke/tokyonight.nvim";
    Load_tokyonight.flake = false;

    ##- Deps -##
    Load_plenary.url = "github:nvim-lua/plenary.nvim";
    Load_plenary.flake = false;

    Load_nvim-web-devicon.url = "github:nvim-tree/nvim-web-devicons";
    Load_nvim-web-devicon.flake = false;

    ##- Langs -##
    Load_nvim-lspconfig.url = "github:neovim/nvim-lspconfig";
    Load_nvim-lspconfig.flake = false;

    Lazy_fidget.url = "github:j-hui/fidget.nvim";
    Lazy_fidget.flake = false;

    Load_neodev.url = "github:folke/neodev.nvim";
    Load_neodev.flake = false;

    Load_nvim-lint.url = "github:mfussenegger/nvim-lint";
    Load_nvim-lint.flake = false;

    Load_comment.url = "github:numToStr/Comment.nvim";
    Load_comment.flake = false;

    Lazy_kmonad-vim.url = "github:kmonad/kmonad-vim";
    Lazy_kmonad-vim.flake = false;

    ##- Autocompletion -##
    Load_nvim-cmp.url = "github:hrsh7th/nvim-cmp";
    Load_nvim-cmp.flake = false;

    #-- Snippet Engine --#
    Load_luasnip.url = "github:L3MON4D3/LuaSnip";
    Load_luasnip.flake = false;

    Load_cmp_luasnip.url = "github:saadparwaiz1/cmp_luasnip";
    Load_cmp_luasnip.flake = false;

    Load_friendly-snippets.url = "github:rafamadriz/friendly-snippets";
    Load_friendly-snippets.flake = false;

    #-- LSP Completion --#
    Load_cmp-nvim-lsp.url = "github:hrsh7th/cmp-nvim-lsp";
    Load_cmp-nvim-lsp.flake = false;

    Load_cmp-nvim-lua.url = "github:hrsh7th/cmp-nvim-lua";
    Load_cmp-nvim-lua.flake = false;

    #-- Cmdline --#
    Load_cmp-cmdline.url = "github:hrsh7th/cmp-cmdline";
    Load_cmp-cmdline.flake = false;

    Load_cmp-buffer.url = "github:hrsh7th/cmp-buffer";
    Load_cmp-buffer.flake = false;

    #-- Path --#
    Load_cmp-path.url = "github:hrsh7th/cmp-path";
    Load_cmp-path.flake = false;

    ##- Neotest -##
    Load_neotest.url = "github:nvim-neotest/neotest";
    Load_neotest.flake = false;

    Load_neotest-jest.url = "github:nvim-neotest/neotest-jest";
    Load_neotest-jest.flake = false;

    ##- Telescope -##
    Load_telescope.url = "github:nvim-telescope/telescope.nvim";
    Load_telescope.flake = false;

    ##- Git -##
    Load_vim-fugitive.url = "github:tpope/vim-fugitive";
    Load_vim-fugitive.flake = false;

    Load_vim-rhubarb.url = "github:tpope/vim-rhubarb";
    Load_vim-rhubarb.flake = false;

    Load_gitsigns.url = "github:lewis6991/gitsigns.nvim";
    Load_gitsigns.flake = false;

    Load_git-worktree.url = "github:ThePrimeagen/git-worktree.nvim";
    Load_git-worktree.flake = false;

    ##- Neorg -##
    Load_neorg.url = "github:nvim-neorg/neorg";
    Load_neorg.flake = false;

    Load_neorg-telescope.url = "github:nvim-neorg/neorg-telescope";
    Load_neorg-telescope.flake = false;

    ##- Other -##
    Load_vim-sleuth.url = "github:tpope/vim-sleuth";
    Load_vim-sleuth.flake = false;

    Load_nvim-tree-lua.url = "github:nvim-tree/nvim-tree.lua";
    Load_nvim-tree-lua.flake = false;

    Load_which-key.url = "github:folke/which-key.nvim";
    Load_which-key.flake = false;

    Load_lualine.url = "github:nvim-lualine/lualine.nvim";
    Load_lualine.flake = false;

    Load_refactoring.url = "github:theprimeagen/refactoring.nvim";
    Load_refactoring.flake = false;

    Load_undotree.url = "github:mbbill/undotree";
    Load_undotree.flake = false;

    Load_vim-be-good.url = "github:ThePrimeagen/vim-be-good";
    Load_vim-be-good.flake = false;

    Load_nvim-colorizer-lua.url = "github:nvchad/nvim-colorizer.lua";
    Load_nvim-colorizer-lua.flake = false;

    Load_dashboard-nvim.url = "github:nvimdev/dashboard-nvim";
    Load_dashboard-nvim.flake = false;

    Load_harpoon-nvim.url = "github:ThePrimeagen/harpoon";
    Load_harpoon-nvim.flake = false;

    Lazy_transparent-nvim.url = "github:xiyaowong/transparent.nvim";
    Lazy_transparent-nvim.flake = false;
  };
}
