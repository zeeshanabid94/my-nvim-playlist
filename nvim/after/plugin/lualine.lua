local lualine = require("lualine")

lualine.setup {
    theme = "tokyonight",
    ignore_focus = {
        "NvimTree"
    },
    extensions = { "nvim-tree" }
}
