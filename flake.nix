{
  description = "Wil Taylor's NeoVim config";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    neovim = {
      url = "github:neovim/neovim?dir=contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };


    rnix-lsp = { url = "github:nix-community/rnix-lsp"; };

    # Vim plugins
    # colorschemes
    gruvbox = { url = "github:morhetz/gruvbox"; flake = false; };
    nord-vim = { url = "github:arcticicestudio/nord-vim"; flake = false; };
    onedark = { url = "github:navarasu/onedark.nvim"; flake = false; };

    # colorschemes
    vim-startify = { url = "github:mhinz/vim-startify"; flake = false; };
    lightline-vim = { url = "github:itchyny/lightline.vim"; flake = false; };
    nvim-lspconfig = { url = "github:neovim/nvim-lspconfig"; flake = false; };
    # completion-nvim = { url = "github:nvim-lua/completion-nvim"; flake = false; };

    # my
    vim-surround = { url = "github:tpope/vim-surround"; flake = false; };
    rust-tools = { url = "github:simrat39/rust-tools.nvim"; flake = false; };
    # my

    vim-nix = { url = "github:LnL7/vim-nix"; flake = false; };
    nvim-dap = { url = "github:mfussenegger/nvim-dap"; flake = false; };
    nvim-telescope = { url = "github:nvim-telescope/telescope.nvim"; flake = false; };
    telescope-dap = { url = "github:nvim-telescope/telescope-dap.nvim"; flake = false; };
    popup-nvim = { url = "github:nvim-lua/popup.nvim"; flake = false; };
    plenary-nvim = { url = "github:nvim-lua/plenary.nvim"; flake = false; };

    nvim-tree-lua = { url = "github:kyazdani42/nvim-tree.lua"; flake = false; };
    vimagit = { url = "github:jreybert/vimagit"; flake = false; };
    fugitive = { url = "github:tpope/vim-fugitive"; flake = false; };
    nvim-lightbulb = { url = "github:kosayoda/nvim-lightbulb"; flake = false; };
    nvim-treesitter = { url = "github:nvim-treesitter/nvim-treesitter"; flake = false; };
    nvim-treesitter-context = { url = "github:romgrk/nvim-treesitter-context"; flake = false; };
    editorconfig-vim = { url = "github:editorconfig/editorconfig-vim"; flake = false; };
    indentline = { url = "github:Yggdroot/indentLine"; flake = false; };
    nvim-blame-line = { url = "github:tveskag/nvim-blame-line"; flake = false; };
    nvim-dap-virtual-text = { url = "github:theHamsta/nvim-dap-virtual-text"; flake = false; };
    vim-cursorword = { url = "github:itchyny/vim-cursorword"; flake = false; };
    vim-test = { url = "github:vim-test/vim-test"; flake = false; };
    nvim-which-key = { url = "github:folke/which-key.nvim"; flake = false; };

    # Autocompletes
    nvim-compe = {
      url = "github:hrsh7th/nvim-compe";
      flake = false;
    };
    nvim-cmp = {
      url = "github:hrsh7th/nvim-cmp";
      flake = false;
    };
    cmp-buffer = {
      url = "github:hrsh7th/cmp-buffer";
      flake = false;
    };
    cmp-nvim-lsp = {
      url = "github:hrsh7th/cmp-nvim-lsp";
      flake = false;
    };
    cmp-vsnip = {
      url = "github:hrsh7th/cmp-vsnip";
      flake = false;
    };
    cmp-path = {
      url = "github:hrsh7th/cmp-path";
      flake = false;
    };
    cmp-treesitter = {
      url = "github:ray-x/cmp-treesitter";
      flake = false;
    };

    # snippets
    vim-vsnip = {
      url = "github:hrsh7th/vim-vsnip";
      flake = false;
    };



    # Visuals
    nvim-cursorline = {
      url = "github:yamatsum/nvim-cursorline";
      flake = false;
    };
    indent-blankline = {
      url = "github:lukas-reineke/indent-blankline.nvim";
      flake = false;
    };
    nvim-web-devicons = {
      url = "github:kyazdani42/nvim-web-devicons";
      flake = false;
    };
    gitsigns-nvim = {
      url = "github:lewis6991/gitsigns.nvim";
      flake = false;
    };


    lspkind = {
      url = "github:onsails/lspkind-nvim";
      flake = false;
    };

    # Autopairs
    nvim-autopairs = {
      url = "github:windwp/nvim-autopairs";
      flake = false;
    };
    nvim-ts-autotag = {
      url = "github:windwp/nvim-ts-autotag";
      flake = false;
    };


  };

  outputs = { self, nixpkgs, neovim, rnix-lsp, ... }@inputs:
    let
      plugins = [
        "gruvbox"
        "onedark"
        "nord-vim"
        "vim-startify"
        "lightline-vim"
        "nvim-lspconfig"
        "vim-surround"
        # "completion-nvim"
        "vim-nix"
        "nvim-dap"
        "nvim-telescope"
        "popup-nvim"
        "plenary-nvim"
        "nvim-web-devicons"
        "nvim-tree-lua"
        "telescope-dap"
        "vimagit"
        "fugitive"
        "nvim-lightbulb"
        "nvim-treesitter"
        "nvim-treesitter-context"
        "editorconfig-vim"
        "indent-blankline"
        "indentline"
        "nvim-blame-line"
        "nvim-dap-virtual-text"
        "vim-cursorword"
        "vim-test"
        "nvim-which-key"



        "nvim-cmp"
        "vim-vsnip"

        "cmp-nvim-lsp"
        "cmp-buffer"
        "cmp-vsnip"
        "cmp-path"
        "cmp-treesitter"

        "lspkind"


        "nvim-cursorline"


        "nvim-autopairs"

        "rust-tools"
      ];

      externalBitsOverlay = top: last: {
        rnix-lsp = rnix-lsp.defaultPackage.${top.system};
        neovim-nightly = neovim.defaultPackage.${top.system};
      };

      pluginOverlay = top: last:
        let
          buildPlug = name: top.vimUtils.buildVimPluginFrom2Nix {
            pname = name;
            version = "master";
            src = builtins.getAttr name inputs;
          };
        in
        {
          neovimPlugins = builtins.listToAttrs (map (name: { inherit name; value = buildPlug name; }) plugins);
        };

      allPkgs = lib.mkPkgs {
        inherit nixpkgs;
        cfg = { };
        overlays = [
          pluginOverlay
          externalBitsOverlay
        ];
      };

      lib = import ./lib;

      mkNeoVimPkg = pkgs: lib.neovimBuilder {
        inherit pkgs;
        config = {
          vim.viAlias = true;
          vim.vimAlias = true;
          vim.dashboard.startify.enable = true;
          vim.dashboard.startify.customHeader = [ "NIXOS NEOVIM CONFIG" ];
          # vim.theme.nord.enable = true;
          vim.theme.gruvbox.enable = true;
          # vim.theme.onedark.enable = true;
          vim.disableArrows = true;
          vim.statusline.lightline.enable = true;
          vim.lsp.enable = true;
          vim.lsp.bash = true;
          vim.lsp.go = true;
          vim.lsp.nix = true;
          vim.lsp.python = true;
          vim.lsp.ruby = true;
          vim.lsp.rust = true;
          vim.lsp.terraform = true;
          vim.lsp.typescript = true;
          vim.lsp.vimscript = true;
          vim.lsp.yaml = true;
          vim.lsp.docker = true;
          vim.lsp.tex = true;
          vim.lsp.css = true;
          vim.lsp.html = true;
          vim.lsp.json = true;
          vim.lsp.clang = true;
          vim.lsp.cmake = false; # Currently broken
          vim.lsp.lightbulb = true;
          vim.lsp.variableDebugPreviews = true;
          # vim.lsp.rust.enable = true;
          vim.fuzzyfind.telescope.enable = true;
          vim.filetree.nvimTreeLua.enable = true;
          vim.git.enable = true;
          vim.formatting.editorConfig.enable = true;
          vim.editor.indentGuide = true;
          vim.editor.underlineCurrentWord = true;
          vim.test.enable = true;

          vim.autopairs.enable = true;
          vim.autocomplete = {
            enable = true;
            type = "nvim-cmp";
          };

          vim.visuals = {
            enable = true;
            nvimWebDevicons.enable = true;
            lspkind.enable = true;
            indentBlankline = {
              enable = true;
              fillChar = "";
              eolChar = "";
              showCurrContext = true;
            };
            cursorWordline = {
              enable = true;
              lineTimeout = 0;
            };
          };
        };
      };

    in
    {

      apps = lib.withDefaultSystems (sys:
        {
          nvim = {
            type = "app";
            program = "${self.defaultPackage."${sys}"}/bin/nvim";
          };
        });

      defaultApp = lib.withDefaultSystems (sys: {
        type = "app";
        program = "${self.defaultPackage."${sys}"}/bin/nvim";
      });

      defaultPackage = lib.withDefaultSystems (sys: self.packages."${sys}".neovimWT);

      packages = lib.withDefaultSystems (sys: {
        neovimWT = mkNeoVimPkg allPkgs."${sys}";
      });
    };
}
