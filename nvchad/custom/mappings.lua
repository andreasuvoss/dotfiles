local M = {}

M.disabled = {
}

-- M.movement = {
--   n = {
--     ["<C-h>"] = {"<C-w>h"},
--     ["<C-l>"] = {"<C-w>l"},
--   }
-- }

M.tabbing = {
  n = {
    -- ["<S-Tab>"] = {"<<"},
  },
  v = {
    ["<"] = {"<gv"},
    [">"] = {">gv"},
    ["<S-Tab>"] = {"<gv"},
    ["<Tab>"] = {">gv"},
  }
}

M.gitsigns = {
  n = {
    ["<leader>gb"] = {":Gitsigns toggle_current_line_blame<CR>"}
  }
}

M.neotree = {
  n = {
    ["<leader>e"] = {":Neotree<CR>"},
    ["<C-z>"] = {":Neotree toggle<CR>"},
  }
}

return M
