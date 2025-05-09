return {
	"nvimdev/lspsaga.nvim",
	cmd = "Lspsaga",
	opts = {
		finder = {
			keys = {
				toggle_or_open = "<CR>",
			},
		},
	},
	keys = {
		{ "<leader>lr", ":Lspsaga rename<CR>" },
		{ "<leader>lc", ":Lspsaga code_action<CR>" },
		{ "<leader>ld", ":Lspsaga goto_definition<CR>" },
		{ "<leader>lh", ":Lspsaga hover_doc<CR>" },
		{ "<leader>lR", ":Lspsaga finder<CR>" },
		{ "<leader>ln", ":Lspsaga fiagnostic_jump_next<CR>" },
		{ "<leader>lp", ":Lspsaga fiagnostic_jump_prev<CR>" },
	},
}
