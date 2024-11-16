return {
  {
    "mfussenegger/nvim-lint",
    event = "BufReadPost", -- Или другой подходящий event
    config = function()
      local lint = require("lint")

      require("lint").linters.cppcheck = {
        name = "cppcheck",
        cmd = "cppcheck",
        stdin = false,
        append_fname = true,
        args = {
          "--check-level=exhaustive",
          "--enable=all",
          "--suppress=missingIncludeSystem",
          "--language=c",
          "--std=c11",
          "--inconclusive",
        },
        stream = "stderr",
        ignore_exitcode = false,
        env = nil,
        parser = require("lint.parser").from_errorformat("%f:%l:%c: %m", {
          lnum = 1,
          col = 2,
          message = 4,
        }),
      }

      lint.linters.cppcheck = require("lint.util").wrap(lint.linters.cppcheck, function(diagnostic)
        diagnostic.severity = vim.diagnostic.severity.INFO -- Устанавливаем серьезность как INFO (синий)
        return diagnostic
      end)

      -- Для файлов .cpp и .c
      require("lint").linters_by_ft = {
        cpp = { "cppcheck" },
        c = { "cppcheck" },
      }

      -- Автозапуск линтера при сохранении
      vim.api.nvim_create_autocmd("BufWritePost", {
        pattern = { "*.cpp", "*.c" },
        callback = function()
          require("lint").try_lint() -- Запуск линтинга после сохранения
        end,
      })

      -- Запуск линтера для C/C++ файлов при открытии
      vim.api.nvim_create_autocmd("BufReadPost", {
        pattern = { "*.cpp", "*.c" },
        callback = lint.try_lint,
      })
    end,
  },
}
