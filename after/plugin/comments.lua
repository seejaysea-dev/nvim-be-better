-- NOTE: TodoComments works together with Trouble: https://github.com/folke/trouble.nvim
-- Available Comment Types
-- FIX:  Example
-- TODO: Example
-- HACK: Example
-- WARN: Example
-- PERF: Example
-- NOTE: Example
-- TEST: Example
-- PASSED: Example
-- FAILED: Example

require("todo-comments").setup {
    highlight = {
        before = "bg",
        after = "bg"
    }
}

-- todo-comments keymaps
vim.keymap.set("n", "<leader>xt", ":TodoTrouble<CR>")
-- vim.keymap.set("n", "<leader>xc", ":TodoTrouble keywords=TODO,FIX,WARN<CR>")
