return {
  {
    "nvim-cmp",
    opts = function(_, opts)
      -- opts.window = {
      --   completion = {
      --     col_offset = 60, -- смещение вправо
      --   },
      -- }
      --
      -- opts.experimental = opts.experimental or {}
      opts.experimental.ghost_text = false

      local cmp = require("cmp")
      opts.mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = function(fallback)
          if cmp.visible() then
            cmp.mapping.abort()(fallback)
          else
            cmp.mapping.complete()(fallback)
          end
        end,
        ["<CR>"] = LazyVim.cmp.confirm({ select = true }),
      })
    end,
  },
}
