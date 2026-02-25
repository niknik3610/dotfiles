local colors = {
    fg = "#d3d3d3",
    bg = "#252829"
}

local function harpoon_component()
	local mark_idx = require("harpoon.mark").get_current_index()
	if mark_idx == nil then
		return ""
	end

	return string.format("󱡅 %d", mark_idx)
end

require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = {
            normal = {
                a = {fg = colors.fg, bg = colors.bg},
                b = {fg = colors.fg, bg = colors.bg},
                c = {fg = colors.fg, bg = colors.bg},
            },

            insert = {a = {fg = colors.fg, bg = colors.bg}, b = {fg = colors.fg, bg = colors.bg}},
            visual = {a = {fg = colors.fg, bg = colors.bg}, b = {fg = colors.fg, bg = colors.bg}},
            command = {a = {fg = colors.fg, bg = colors.bg}, b = {fg = colors.fg, bg = colors.bg}},
            replace = {a = {fg = colors.fg, bg = colors.bg}, b = {fg = colors.fg, bg = colors.bg}},

            inative = {
                a = {fg = colors.fg, bg = colors.bg},
                b = {fg = colors.fg, bg = colors.bg},
                c = {fg = colors.fg, bg = colors.bg},
            },
        },
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        }
    },
    sections = {
        lualine_a = {'branch'},
        lualine_b = {'filename'},
        lualine_c = {},
        lualine_x = {{
            'diagnostics',
            sources = { 'nvim_diagnostic', 'coc' },

            -- Displays diagnostics for the defined severity types
            sections = { 'error', 'warn', 'info', 'hint' },

            diagnostics_color = {
                -- Same values as the general color option can be used here.
                error = 'DiagnosticError', -- Changes diagnostics' error color.
                warn  = 'DiagnosticWarn',  -- Changes diagnostics' warn color.
                info  = 'DiagnosticInfo',  -- Changes diagnostics' info color.
                hint  = 'DiagnosticHint',  -- Changes diagnostics' hint color.
            },
            colored = false,           -- Displays diagnostics status in color if set to true.
            update_in_insert = false, -- Update diagnostics in insert mode.
            always_visible = false,
        }},
        lualine_y = {{harpoon_component}},
        lualine_z = {}
    },
}
