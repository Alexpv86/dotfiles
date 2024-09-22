local cmp = require("cmp")

-- Функция для перехода к предыдущей записи с другим 'kind'
local function select_prev_kind()
  -- Получаем текущую выбранную запись
  local current_entry = cmp.get_selected_entry()

  if not current_entry then
    cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
    current_entry = cmp.get_selected_entry()
  end

  local current_kind = current_entry.completion_item.kind

  cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
  local prev_entry = cmp.get_selected_entry()

  if not prev_entry or prev_entry.completion_item.kind ~= current_kind then
    if not prev_entry then
      cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
    end
    current_entry = cmp.get_selected_entry()
    current_kind = current_entry.completion_item.kind
  end

  for _ = 1, #cmp.get_entries() do
    cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
    prev_entry = cmp.get_selected_entry()

    -- Проверяем, отличается ли категория (kind) нового элемента
    if not prev_entry or prev_entry.completion_item.kind ~= current_kind then
      cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
      return
    end
  end
end

-- Функция для перехода к следующей записи с другим 'kind'
local function select_next_kind()
  -- Получаем текущую выбранную запись
  local current_entry = cmp.get_selected_entry()

  if not current_entry then
    -- Если ничего не выбрано, просто выбираем первый элемент
    cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
    current_entry = cmp.get_selected_entry()
  end

  -- Текущий 'kind' (категория) выбранной записи
  local current_kind = current_entry.completion_item.kind

  -- Начинаем с текущей записи и ищем первую с другим 'kind'
  for _ = 1, #cmp.get_entries() do
    cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
    local next_entry = cmp.get_selected_entry()

    if not next_entry then
      cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
      return
    end

    -- Проверяем, отличается ли категория (kind) нового элемента
    if next_entry.completion_item.kind ~= current_kind then
      return
    end
  end
end

cmp.setup({
  window = {
    completion = {
      border = { "", "", "", "", "", "", "", "│" }, -- Вертикальная полоса слева
      col_offset = 5, -- смещение вправо
    },
  },
})

return {
  {
    "nvim-cmp",
    opts = function(_, opts)
      -- opts.experimental = opts.experimental or {}
      opts.experimental.ghost_text = false

      opts.mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = function(fallback)
          if cmp.visible() then
            cmp.mapping.abort()(fallback)
          else
            cmp.mapping.complete()(fallback)
          end
        end,
        ["<CR>"] = LazyVim.cmp.confirm({ select = true }),
        ["<Right>"] = function()
          select_next_kind()
        end,
        ["<Left>"] = function()
          select_prev_kind()
        end,
      })

      opts.completion = {
        completeopt = "menu,menuone,noselect",
      }
    end,
  },
}
