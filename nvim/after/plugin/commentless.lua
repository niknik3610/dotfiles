require('commentless').setup {
    vim.keymap.set("n", "<leader>/", function()
        require("commentless").toggle()
    end)
}
