local lush = require "lush"
local hsluv = lush.hsluv
local generator = require "zenbones.specs"
local bg = vim.o.background
local p = require("neobones.palette")[bg]
local theme = require "neobones"

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
			LeapBackdrop { fg = theme.Comment.fg },

			LualineEmpty { fg = p.bg, bg = p.bg },
		}
		-- selene: deny(undefined_variable)
		---@diagnostic enable: undefined-global
	end)
end
