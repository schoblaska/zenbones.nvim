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
		Type { fg = p.dark.leaf.mix(p.base.nord8, 33) },
		Special { fg = p.dark.blossom.mix(p.base.nord9, 5) },

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

		NotifyERRORBorder { fg = p.dark.rose.darken(10) },
		NotifyWARNBorder { fg = p.dark.wood.darken(10) },
		NotifyINFOBorder { fg = p.dark.leaf.darken(10) },
		NotifyDEBUGBorder { fg = p.dark.fg.darken(40) },
		NotifyTRACEBorder { fg = p.dark.blossom.darken(10) },
		NotifyERRORIcon { fg = p.dark.rose },
		NotifyWARNIcon { fg = p.dark.wood },
		NotifyINFOIcon { fg = p.dark.leaf },
		NotifyDEBUGIcon { fg = p.dark.fg.darken(40) },
		NotifyTRACEIcon { fg = p.dark.blossom },
		NotifyERRORTitle { fg = p.dark.rose },
		NotifyWARNTitle { fg = p.dark.wood },
		NotifyINFOTitle { fg = p.dark.leaf },
		NotifyDEBUGTitle { fg = p.dark.fg.darken(40) },
		NotifyTRACETitle { fg = p.dark.blossom },

		DiagnosticUnnecessary { specs.Comment },

		VertSplit { fg = p.dark.bg.darken(25) },
	}
	-- selene: deny(undefined_variable)
	---@diagnostic enable: undefined-global
end)
