-- <Language> support,
-- Configuring here instead of in lsp.lua, format.lua, and treesitter.lua
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "javascript",
        "jsdoc",
        "tsx",
        "typescript",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tsserver = {
          enabled = false,
        },
        vtsls = {
          -- explicitly add filetypes so we can extend them(?) This is stolen from [lazyvim](https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/plugins/extras/lang/typescript.lua)
          filetypes = {
            "javascript",
            "javascriptreact",
            "javascript.jsx",
            "typescript",
            "typescriptreact",
            "typescript.jsx",
          },
          settings = {
            complete_function_calls = true,
            vtsls = {
              enableMoveToFileCodeAction = true,
              autoUseWorkspaceTsdk = true,
              experimental = {
                completion = {
                  enableServerSideFuzzyMatch = true,
                },
              },
            },
            typescript = {
              updateImportsOnFileMove = { enabled = "always" },
              suggest = {
                completeFunctionCalls = true,
              },
              inlayHints = {
                enumMemberValues = { enabled = true },
                functionLikeReturnTypes = { enabled = true },
                parameterNames = { enabled = "literals" },
                parameterTypes = { enabled = true },
                propertyDeclarationTypes = { enabled = true },
                variableTypes = { enabled = false },
              },
            },
          },
          -- TODO: Convert LazyVim keys to something usable in my setup.
          keys = {
            -- {
            --   "gD",
            --   function()
            --     local params = vim.lsp.util.make_position_params()
            --     LazyVim.lsp.execute({
            --       command = "typescript.goToSourceDefinition",
            --       arguments = { params.textDocument.uri, params.position },
            --       open = true,
            --     })
            --   end,
            --   desc = "Goto Source Definition",
            -- },
            -- {
            --   "gR",
            --   function()
            --     LazyVim.lsp.execute({
            --       command = "typescript.findAllFileReferences",
            --       arguments = { vim.uri_from_bufnr(0) },
            --       open = true,
            --     })
            --   end,
            --   desc = "File References",
            -- },
            -- {
            --   "<leader>co",
            --   LazyVim.lsp.action["source.organizeImports"],
            --   desc = "Organize Imports",
            -- },
            -- {
            --   "<leader>cM",
            --   LazyVim.lsp.action["source.addMissingImports.ts"],
            --   desc = "Add missing imports",
            -- },
            -- {
            --   "<leader>cu",
            --   LazyVim.lsp.action["source.removeUnused.ts"],
            --   desc = "Remove unused imports",
            -- },
            -- {
            --   "<leader>cD",
            --   LazyVim.lsp.action["source.fixAll.ts"],
            --   desc = "Fix all diagnostics",
            -- },
            -- {
            --   "<leader>cV",
            --   function()
            --     LazyVim.lsp.execute({ command = "typescript.selectTypeScriptVersion" })
            --   end,
            --   desc = "Select TS workspace version",
            -- },
          },
        },
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {},
  },
  {
    "williamboman/mason.nvim",
    opts = {},
  },
}
