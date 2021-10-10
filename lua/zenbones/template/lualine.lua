local template = [[-- This file is auto-generated from lua/zenbones/template/lualine.lua
local common_fg = "${common_fg}"
local inactive_bg = "${inactive_bg}"
local inactive_fg = "${inactive_fg}"

return {
	normal = {
		a = { bg = "${normal_a_bg}", fg = common_fg, gui = "bold" },
		b = { bg = "${normal_b_bg}", fg = common_fg },
		c = { bg = "${normal_c_bg}", fg = "${normal_c_fg}" },
	},

	insert = {
		a = { bg = "${insert_a_bg}", fg = common_fg, gui = "bold" },
	},

	command = {
		a = { bg = "${command_a_bg}", fg = common_fg, gui = "bold" },
	},

	visual = {
		a = { bg = "${visual_a_bg}", fg = common_fg, gui = "bold" },
	},

	replace = {
		a = { bg = "${replace_a_bg}", fg = common_fg, gui = "bold" },
	},

	inactive = {
		a = { bg = inactive_bg, fg = inactive_fg, gui = "bold" },
		b = { bg = inactive_bg, fg = inactive_fg },
		c = { bg = inactive_bg, fg = inactive_fg },
	},
}
]]

return function(name, specs, p)
	return {
		string.format("lua/lualine/themes/%s.lua", name),
		template,
		{
			common_fg = specs.Folded.fg.hex,
			inactive_bg = specs.StatusLineNC.bg.hex,
			inactive_fg = specs.StatusLineNC.fg.hex,
			normal_a_bg = specs.PmenuSbar.bg.hex,
			normal_b_bg = specs.PmenuSel.bg.hex,
			normal_c_bg = specs.StatusLine.bg.hex,
			normal_c_fg = specs.StatusLine.fg.hex,
			insert_a_bg = specs.DiffText.bg.hex,
			command_a_bg = specs.Search.bg.hex,
			visual_a_bg = specs.Visual.bg.hex,
			replace_a_bg = specs.DiffDelete.bg.hex,
		},
	}
end
