return {
  {
    "Exafunction/codeium.vim",
    config = function()
      -- vim.g.disable_tab_accept =
      --   true,
      vim.g.codeium_disable_bindings = true

      -- Принять все предложение
      vim.keymap.set("i", "<C-CR>", function()
        return vim.fn["codeium#Accept"]()
      end, { expr = true })
      -- Прокрутка предложений вперед
      vim.keymap.set("i", "<C-n>", function()
        return vim.fn["codeium#CycleCompletions"](1)
      end, { expr = true })

      -- Прокрутка предложений назад
      vim.keymap.set("i", "<C-p>", function()
        return vim.fn["codeium#CycleCompletions"](-1)
      end, { expr = true })

      vim.keymap.set("i", "<C-w>", function()
        return vim.fn["codeium#AcceptNextWord"]()
      end, { expr = true })
    end,
  },
}
