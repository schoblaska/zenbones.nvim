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
end
