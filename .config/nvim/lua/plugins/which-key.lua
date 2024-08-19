return {
  "folke/which-key.nvim",
  -- keys = {{"<space>"}, {"["}, {"]"}, {"_"},
  --         {"<left>"}, {"<right>"}, {"<up>"}, {"<down>"},
  --         {"<esc>"}, {"s"}, {"ø"}},
  opts = {
    -- preset = "helix",
    delay = function(ctx)
      return ctx.plugin and 0 or 800
    end,
    icons = {
      breadcrumb = "»",
      separator = "",
      group = "+",
      ellipsis = "…",
      rules = false,
      colors = true,
      keys = {
          Up = "up",
          Down = "dn",
          Left = "<-",
          Right = "->",
          C = "c-",
          M = "m-",
          D = "d-",
          S = "s-",
          CR = "cr",
          Esc = "^[",
          BS = "bs",
          Space = "sp",
          Tab = "tb",
      },
    },
    spec = {
      {"<down>", ":wincmd j<cr>", desc = "win down"},
      {"<esc>", ":normal '\\<esc\\>'<cr>:silent! nohls<cr>:silent! NoiceDismiss<cr>", desc = "esc"},
      {"<left>", ":wincmd h<cr>", desc = "win left"},
      {"<right>", ":wincmd l<cr>", desc = "win right"},
      {"<space>", group = "quick"},
      {"<space><space>", function()
          require"telescope.builtin".buffers{select_current = true}
        end, desc = "buffers" },
      {"<space>[", vim.lsp.buf.references, desc = "references"},
      {"<space>]", vim.lsp.buf.definition, desc = "definition"},
      {"<space>a", vim.lsp.buf.code_action, desc = "code actions"},
      {"<space>b", function() require"gitsigns".blame_line() end, desc = "git-blame"},
      {"<space>d", ":x<cr>", desc = "close"},
      {"<space>D", function() require"term".close(nil, "current") end, desc = "term-close"},
      {"<space>f", function() require"conform".format() end, desc = "format"},
      -- {"<space>F", ":w<cr>:!pyment --write --output google %<cr>", desc = "pyment"},
      {"<space>g", function() require"telescope.builtin".live_grep() end, desc = "grep content"},
      {"<space>G", function() require"telescope.builtin".find_files() end, desc = "grep file"},
      {"<space>i", function() require"term".insert() end, desc = "insert-repl"},
      {"<space>k", vim.lsp.buf.signature_help, desc = "signature"},
      {"<space>r", ":IncRename ", desc = "lsp-rename" },
      {"<space>s", ":write<cr>", desc = "save"},
      {"<space>S", ":setlocal spell!<cr>", desc = "spell"},
      {"<space>t", function() require"term".exec_test("fish") end, desc = "test"},
      {"<space>v", ":vsplit<cr>", desc = "vsplit"},
      {"<space>x", function() require"term".exec_file() end, desc = "exec-file"},
      {"<up>", ":wincmd k<cr>", desc = "win up"},
      {"[", group = "previous" },
      {"[b", ":bprev<cr>", desc = "buffer" },
      {"[c", ":cprev<cr>", desc = "error" },
      {"[g", function() require"gitsigns".prev_hunk() end, desc = "hunk" },
      {"[l", vim.diagnostic.goto_prev, desc = "lsp-error" },
      {"[s", "[s", desc = "spell" },
      {"]", group = "next" },
      {"]b", ":bnext<cr>", desc = "buffer" },
      {"]c", ":cnext<cr>", desc = "error" },
      {"]g", function() require"gitsigns".next_hunk() end, desc = "hunk" },
      {"]l", vim.diagnostic.goto_next, desc = "lsp-error" },
      {"]s", "]s", desc = "spell" },
      {"_", group = "textcase" },
      {"_C", function() require"textcase".operator('to_constant_case') end, desc = "CONSTANT_CASE" },
      {"_d", function() require"textcase".operator('to_dot_case') end, desc = "dot.case" },
      {"_p", function() require"textcase".operator('to_pascal_case') end, desc = "PascalCase" },
      {"_P", function() require"textcase".operator('to_path_case') end, desc = "path/case"},
      {"_S", function() require"textcase".operator('to_phrase_case') end, desc = "Sentence case" },
      {"_c", function() require"textcase".operator('to_camel_case') end, desc = "camelCase" },
      {"_l", function() require"textcase".operator('to_lower_case') end, desc = "lower case"},
      {"_D", function() require"textcase".operator('to_dash_case') end, desc = "dash-case"},
      {"_s", function() require"textcase".operator('to_snake_case') end, desc = "snake_case"},
      {"_t", function() require"textcase".operator('to_title_case') end, desc = "Title Case" },
      {"_u", function() require"textcase".operator('to_upper_case') end, desc = "UPPER CASE" },
      {"s", ":silent! write<cr>", desc = "save"},
      {"ø", function() require"term".insert("fish") end, desc = "term" },
      {"Ø", function() require"term".open("fish") end, desc = "term" },
      {"æ", ":silent! exec ':cd '.fnamemodify(expand('%'), ':h')<cr>:", desc = "cmd-local"},
      {"Æ", ":Gcd<cr>:<C-f>a", desc = "cmd-root"},
    },
  },
}
