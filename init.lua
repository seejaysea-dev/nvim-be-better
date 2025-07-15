require("carte")

local ok, _ = pcall(require, 'work')

if not ok then
  print("Unable to load work")
end

require("after")
