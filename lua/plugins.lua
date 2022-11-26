-- 自动安装 Packer.nvim
-- 插件安装目录
-- ~/.local/share/nvim/site/pack/packer/
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local packer_bootstrap
--自动安装packer.nvim
if fn.empty(fn.glob(install_path)) > 0 then
  vim.notify("正在安装Pakcer.nvim，请稍后...")
  packer_bootstrap = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })

  -- https://github.com/wbthomason/packer.nvim/issues/750
  local rtp_addition = vim.fn.stdpath("data") .. "/site/pack/*/start/*"
  if not string.find(vim.o.runtimepath, rtp_addition) then
    vim.o.runtimepath = rtp_addition .. "," .. vim.o.runtimepath
  end
  vim.notify("Pakcer.nvim 安装完毕")
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  vim.notify("没有安装 packer.nvim")
  return
end

packer.startup({
  function(use)
    -- Packer 可以升级自己
    use("wbthomason/packer.nvim")

    -- nvim-notify
    use({
       "rcarriga/nvim-notify",
      config = function()
        require("PluginConfig.nvim-notify")
      end,
    })

     -- dashboard-nvim
    use({
      "glepnir/dashboard-nvim",
      config = function()
        require("PluginConfig.dashboard")
      end,
    })

    -- nvim-tree
    use({
      "kyazdani42/nvim-tree.lua",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require("PluginConfig.nvim-tree")
      end,
    })

    -- bufferline
    use({
      "akinsho/bufferline.nvim",
      requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" },
      config = function()
          require("PluginConfig.bufferline")
      end,
    })

    -- lualine
    use({
      "nvim-lualine/lualine.nvim",
      requires = { "kyazdani42/nvim-web-devicons" },
      config = function()
          require("PluginConfig.lualine")
      end,
    })

    --leap
    use({
		"ggandor/leap.nvim",
		config=function()
          require("PluginConfig.leap")
		end,
    })

    ---- telescope
    use({
      "nvim-telescope/telescope.nvim",
      -- opt = true,
      -- cmd = "Telescope",
      requires = {
        -- telescope extensions
        { "LinArcX/telescope-env.nvim" },
        { "nvim-telescope/telescope-ui-select.nvim" },
      },
      config = function()
        require("PluginConfig.telescope")
      end,
    })

    -- project
    use({
      "ahmedkhalf/project.nvim",
      config = function()
          require("PluginConfig.project")
      end,
    })

    -- treesitter
    use({
      "nvim-treesitter/nvim-treesitter",
      run = function()
        -- require("nvim-treesitter.install").update({ with_sync = true })
      end,
      requires = {
        { "p00f/nvim-ts-rainbow" },
        { "JoosepAlviste/nvim-ts-context-commentstring" },
        { "windwp/nvim-ts-autotag" },
        { "nvim-treesitter/nvim-treesitter-refactor" },
        { "nvim-treesitter/nvim-treesitter-textobjects" },
      },
      config = function()
          require("PluginConfig.nvim-treesitter")
      end,
    })

    -- indent-blankline
    use({
      "lukas-reineke/indent-blankline.nvim",
      config = function()
          require("PluginConfig.indent-blankline")
      end,
    })

    -- toggleterm
    use({
      "akinsho/toggleterm.nvim",
      config = function()
          require("PluginConfig.toggleterm")
      end,
    })

    -- nvim-surround
    use({
      "kylechui/nvim-surround",
      config = function()
       -- require("plugin-config.nvim-surround")
      end,
    })

    -- Comment
    use({
      "numToStr/Comment.nvim",
      config = function()
          require("PluginConfig.comment")
      end,
    })

    -- nvim-autopairs
    use({
      "windwp/nvim-autopairs",
      config = function()
          require("PluginConfig.nvim-autopairs")
      end,
    })

    -- fidget.nvim
    use({
      "j-hui/fidget.nvim",
      config = function()
          require("PluginConfig.fidget")
      end,
    })

    -- todo-comments.nvim
    --use({
     -- "folke/todo-comments.nvim",
    --  requires = "nvim-lua/plenary.nvim",
    --  config = function()
     --  -- require("plugin-config.todo-comments")
     -- end,
    --})

    --------------------- LSP --------------------
    -- installer
    use({ "williamboman/mason.nvim" })
    use({ "williamboman/mason-lspconfig.nvim" })
    -- Lspconfig
    use({ "neovim/nvim-lspconfig" })
    -- 补全引擎
    use("hrsh7th/nvim-cmp")
    -- Snippet 引擎
    use("L3MON4D3/LuaSnip")
    use("saadparwaiz1/cmp_luasnip")
    -- 补全源
    use("hrsh7th/cmp-vsnip")
    use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
    use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
    use("hrsh7th/cmp-path") -- { name = 'path' }
    use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }
    use("hrsh7th/cmp-nvim-lsp-signature-help") -- { name = 'nvim_lsp_signature_help' }
    -- 常见编程语言代码段
    use("rafamadriz/friendly-snippets")
    -- UI 增强
    use("onsails/lspkind-nvim")
    use("tami5/lspsaga.nvim")
    -- 代码格式化
    use("mhartington/formatter.nvim")
    use({ "jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim" })
    -- TypeScript 增强
    use({ "jose-elias-alvarez/nvim-lsp-ts-utils", requires = "nvim-lua/plenary.nvim" })
    use("jose-elias-alvarez/typescript.nvim")

    -- Lua 增强
    use("folke/neodev.nvim")
    -- JSON 增强
    use("b0o/schemastore.nvim")
    -- Rust 增强
    use("simrat39/rust-tools.nvim")
    --------------------- colorschemes --------------------
    -- onedark
     use({
      "ful1e5/onedark.nvim",
      config = function()
          require("PluginConfig.onedark")
      end,
    })
    -------------------------------------------------------

    -- git
    use({
      "lewis6991/gitsigns.nvim",
      config = function()
          require("PluginConfig.gitsigns")
      end,
    })
    -- vimspector
    use({
      "puremourning/vimspector",
      cmd = { "VimspectorInstall", "VimspectorUpdate" },
      fn = { "vimspector#Launch()", "vimspector#ToggleBreakpoint", "vimspector#Continue" },
      config = function()
          require("keybindings").mapVimspector()
      end,
    })
    ----------------------------------------------
    -- nvim-dap
    use("mfussenegger/nvim-dap")
    use("theHamsta/nvim-dap-virtual-text")
    use("rcarriga/nvim-dap-ui")

    -- node
    --use({
    --  "mxsdev/nvim-dap-vscode-js",
    --  requires = { "mfussenegger/nvim-dap" },
    --  config = function()
    --    require("dap.nvim-dap.config.vscode-js")
    --  end,
    --})

    if packer_bootstrap then
      packer.sync()
    end
  end,
  config = {
    -- 锁定插件版本在snapshots目录
    --snapshot_path = require("packer.util").join_paths(vim.fn.stdpath("config"), "snapshots"),

    -- 最大并发数
    max_jobs = 10,
    -- 自定义源
    git = {
      -- default_url_format = "https://hub.fastgit.xyz/%s",
      -- default_url_format = "https://mirror.ghproxy.com/https://github.com/%s",
      -- default_url_format = "https://gitcode.net/mirrors/%s",
      -- default_url_format = "https://gitclone.com/github.com/%s",
    },
    display = {
    -- 使用浮动窗口显示
      open_fn = function()
        return require("packer.util").float({ border = "single" })
      end,
    },
  },
})
