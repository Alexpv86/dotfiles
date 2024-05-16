return {
  "nvim-cmp",
  opts = function(_, opts)
    table.remove(opts.sources, 1)
    table.insert(opts.sources, 1, {
      name = "codeium",
      group_index = 1,
      priority = -100,
    })
  end,
}
