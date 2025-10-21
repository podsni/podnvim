--TODO: arema
--FIX: arema
--NOTE: testing
--WARNING:why
--PERF:testing
--HACK:testing
return {
	"folke/todo-comments.nvim",
	event = "VimEnter",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = { signs = false },
}
