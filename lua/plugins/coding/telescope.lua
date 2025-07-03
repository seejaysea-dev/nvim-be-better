local function normalize_path(path)
  return path:gsub("\\", "/")
end

local function normalize_cwd()
  return normalize_path(vim.loop.cwd()) .. "/"
end

local function is_subdirectory(cwd, path)
  return string.lower(path:sub(1, #cwd)) == string.lower(cwd)
end

local function split_filepath(path)
  local normalized_path = normalize_path(path)
  local normalized_cwd = normalize_cwd()
  local filename = normalized_path:match("[^/]+$")

  if is_subdirectory(normalized_cwd, normalized_path) then
    local stripped_path = normalized_path:sub(#normalized_cwd + 1, -(#filename + 1))
    return stripped_path, filename
  else
    local stripped_path = normalized_path:sub(1, -(#filename + 1))
    return stripped_path, filename
  end
end

local function display_file_first(_, path)
  local stripped_path, filename = split_filepath(path)
  if filename == stripped_path or stripped_path == "" then
    return filename
  end
  return string.format("%s (%s)", filename, stripped_path)
end

return {
  "nvim-telescope/telescope.nvim",
  lazy = false,
  tag = "0.1.8",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    {
      -- HACK: This is easier
      "<C-p>",
      "<cmd>Telescope git_files<cr>",
    },
    {
      -- HACK: This is easier
      "<leader>pf",
      "<cmd>Telescope find_files<cr>",
    },
    {
      -- HACK: This is easier
      "<leader>ps",
      "<cmd>Telescope live_grep<cr>",
      desc = "Telescope Grep"
    },
  },
  --@type telescope.Opts
  opts = {
    defaults = {
      layout_strategy = "horizontal",
      layout_config = { prompt_position = "top" },
      sorting_strategy = "ascending",
      scroll_strategy = "limit",
      path_display = display_file_first,
      winblend = 0,
    },
  },
}
