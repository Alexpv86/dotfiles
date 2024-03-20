return {
  -- add symbols-outline
  {
    "okuuva/auto-save.nvim",

    -- cmd = "",
    -- keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
    event = { "BufLeave", "FocusLost" },

    opts = {
      -- add your options that should be passed to the setup() function here
      -- position = "right",
      enabled = true,
      --execution_message = {
      --  message = function() -- message to print on save
      --    return ""
      --  end,
      --},

      trigger_events = { -- See :h events
        immediate_save = { "BufLeave", "FocusLost" }, -- vim events that trigger an immediate save
        defer_save = { "InsertLeave", "TextChanged" }, -- vim events that trigger a deferred save (saves after `debounce_delay`)
        cancel_defered_save = { "InsertEnter" }, -- vim events that cancel a pending deferred save
      },
      -- function that takes the buffer handle and determines whether to save the current buffer or not
      -- return true: if buffer is ok to be saved
      -- return false: if it's not ok to be saved
      -- if set to `nil` then no specific condition is applied
      condition = nil,
      write_all_buffers = true, -- write all buffers when the current one meets `condition`
      noautocmd = false, -- do not execute autocmds when saving
      debounce_delay = 10000, -- delay after which a pending save is executed
    },
  },
}
