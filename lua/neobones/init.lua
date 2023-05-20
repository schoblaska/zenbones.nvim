local lush = require "lush"
local hsluv = lush.hsluv
local generator = require "zenbones.specs"
local bg = vim.o.background
local p = require("neobones.palette")[bg]

vim.g.neobones_lighten_comments = 42

local specs = generator.generate(p, bg, generator.get_global_config("neobones", bg))

if bg == "light" then
	return lush.extends({ specs }).with(function()
		---@diagnostic disable: undefined-global
		-- selene: allow(undefined_variable)
		return {
			helpHyperTextJump { fg = hsluv "#195174" }, -- --link-color
			helpOption { helpHyperTextJump },
			markdownUrl { helpHyperTextJump },
		}
		-- selene: deny(undefined_variable)
		---@diagnostic enable: undefined-global
	end)
else
	return lush.extends({ specs }).with(function()
		---@diagnostic disable: undefined-global
		-- selene: allow(undefined_variable)
		return {
			FloatBorder { specs.FloatBorder, fg = hsluv "#203f57" }, -- --border-color
			helpHyperTextJump { fg = hsluv "#658d57" }, -- --link-color
			helpOption { helpHyperTextJump },
			markdownUrl { helpHyperTextJump },

			IndentBlanklineIndent1 { fg = p.bg.lighten(10) },
			IndentBlanklineContextChar { fg = p.bg.lighten(25) },

			LeapLabelPrimary { fg = p.bg, bg = p.blossom },
			LeapBackdrop { fg = hsluv "#546976" },

			LualineEmpty { fg = p.bg, bg = p.bg },

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
		}
		-- selene: deny(undefined_variable)
		---@diagnostic enable: undefined-global
	end)
end
