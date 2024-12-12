-- Add extra plugins and remaps related to work to remaps.lua and set.lua
-- These files are in gitignore, so only require them if they exist
if FileExists(NvimDirectory .. "/lua/work/remaps.lua") then
  require("work.remaps")
end

if FileExists(NvimDirectory .. "/lua/work/set.lua") then
  require("work.set")
end
