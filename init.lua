-- bootstrap lazy.nvim, LazyVim and your plugins
function exists(file)
  local ok, err, code = os.rename(file, file)
  if ok and (err ~= 13) then
    return true
  else
    return ok, err
  end
end

require("carte")
require("config.lazy")
require("config.lazybase")

-- If there is my work directory, load it
if exists(NvimDirectory .. "/lua/work/init.lua") then
  require("work")
end

ColorMyPencils("catppuccin")
