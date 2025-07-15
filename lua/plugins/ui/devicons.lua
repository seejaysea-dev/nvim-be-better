return {
  {
    "nvim-tree/nvim-web-devicons",
    -- NOTE: opts_extend isn't working?
    -- opts_extend = { "override_by_filename", "override_by_extension", },
    opts = {
      override_by_filename = {
        [".gitignore"] = {
          icon = "",
          color = "#f1502f",
          name = "Gitignore"
        },
        ["Cargo.toml"] = {
          icon = "",
          color = "#f1502f",
          name = "Cargo.toml"
        },
        [".eslintrc.js"] = {
          icon = "󰱺",
        },
        [".node-version"] = {
          icon = "",
        },
        [".prettierrc"] = {
          icon = "",
        },
        [".yarnrc.yml"] = {
          icon = "",
        },
        ["eslint.config.js"] = {
          icon = "󰱺",
        },
        ["package.json"] = {
          icon = "",
        },
        ["tsconfig.json"] = {
          icon = "",
        },
        ["tsconfig.build.json"] = {
          icon = "",
        },
        ["yarn.lock"] = {
          icon = "",
        },
      },
    }
  },
}
