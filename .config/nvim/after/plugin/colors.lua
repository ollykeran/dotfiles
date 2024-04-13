function ColorTheThings(color)
    color = color or "nightfox"
    vim.cmd.colorscheme(color)
end

ColorTheThings()