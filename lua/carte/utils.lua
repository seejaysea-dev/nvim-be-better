BufferFileName = function()
  local fileName = vim.fn.expand("%:p"):gsub(Carte.RootDir .. "\\", "")

  return fileName
end

FileExists = function(file)
  local ok, err, _ = os.rename(file, file)
  if ok and (err ~= 13) then
    return true
  else
    return ok, err
  end
end

function ColorMyPencils(color)
  color = color or "tokyonight"
  vim.cmd.colorscheme(color)
end
