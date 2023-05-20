local lush = require "lush"
local generator = require "zenbones.specs"
local p = require "nordbones.palette"

vim.g.nordbones_lighten_comments = 42

local specs = generator.generate(p.dark, "dark", generator.get_global_config("nordbones", "dark"))

return lush.extends({ specs }).with(function()
	---@diagnostic disable: undefined-global
	-- selene: allow(undefined_variable)
	return {
		Constant { fg = specs.Constant.fg, gui = "" },
		Number { fg = p.base.nord7, gui = "" },
		Identifer { fg = p.dark.fg },
		Function { fg = p.base.nord8 },
		Statement { fg = p.base.nord9 },
		Type { fg = p.dark.leaf.mix(p.base.nord8, 40) },
		Special { fg = p.dark.blossom.mix(p.base.nord9, 15) },

		IndentBlanklineIndent1 { fg = p.dark.bg.lighten(10) },
		IndentBlanklineContextChar { fg = p.dark.bg.lighten(25) },

		LeapLabelPrimary { fg = p.dark.bg, bg = p.dark.leaf },
		LeapBackdrop { fg = specs.Comment.fg },

		TabLine { fg = specs.Comment.fg },
		TabLineFill { bg = p.dark.bg },
		TabLineSel { fg = specs.Normal.fg },
		TabLineSeparator { fg = specs.Comment.fg, bg = p.dark.bg },
		TabLineSeparatorSel { fg = p.dark.leaf },

		AerialNormal { specs.NvimTreeNormal },
		AerialNormalNC { specs.NvimTreeNormal },
		DiffViewNormal { specs.NvimTreeNormal },

		LualineEmpty { fg = p.dark.bg, bg = p.dark.bg },

		TreesitterContext { specs.Normal },

		CmpItemKindCopilot { specs.CmpItemKind },

		NotifyERRORBorder { fg = p.rose.darken(10) },
		NotifyWARNBorder { fg = p.wood.darken(10) },
		NotifyINFOBorder { fg = p.leaf.darken(10) },
		NotifyDEBUGBorder { fg = p.fg.darken(40) },
		NotifyTRACEBorder { fg = p.blossom.darken(10) },
		NotifyERRORIcon { fg = p.rose },
		NotifyWARNIcon { fg = p.wood },
		NotifyINFOIcon { fg = p.leaf },
		NotifyDEBUGIcon { fg = p.fg.darken(40) },
		NotifyTRACEIcon { fg = p.blossom },
		NotifyERRORTitle { fg = p.rose },
		NotifyWARNTitle { fg = p.wood },
		NotifyINFOTitle { fg = p.leaf },
		NotifyDEBUGTitle { fg = p.fg.darken(40) },
		NotifyTRACETitle { fg = p.blossom },
	}
	-- selene: deny(undefined_variable)
	---@diagnostic enable: undefined-global
end)
