require'nvim-treesitter.configs'.setup {
  textobjects = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
	-- Such `yaf` to copy an entire function
	-- Easiest to play with by entering visual mode first 

	-- function.outer includes the entire function
        ["fo"] = "@function.outer",
	-- function.inner excludes the brackets and contents outside them
        ["fi"] = "@function.inner",

        ["co"] = "@class.outer",
        ["ci"] = "@class.inner",
      },
    },
  },
  textobjects = {
    lsp_interop = {
      enable = true,
      border = 'none',
      peek_definition_code = {
	-- Do twice to enter window
	
	-- Peek at the function under the cursor 
	-- leader peek function
        ["<leader>pf"] = "@function.outer",
	-- Peek at the class under the cursor
	-- leader peek class
        ["<leader>pc"] = "@class.outer",
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist

      -- Navigate across text objects (like fns) quickly
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
    },
    swap = {
      enable = true,
      swap_next = {
	-- Adjust parameter order
        ["<leader>a"] = "@parameter.inner",
      },
      swap_previous = {
        ["<leader>A"] = "@parameter.inner",
      },
    },
  },
}
