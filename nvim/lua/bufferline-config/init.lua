require('bufferline').setup {
  options = {
    max_name_length = 18,
    max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
    tab_size = 0,
    offsets = { { filetype = "NvimTree", text = "File Explorer", text_align = "left" } },
    mode = "buffers", -- set to "tabs" to only show tabpages instead
    indicator_style = '▎',
    modified_icon = '●',
    left_trunc_marker = '',
    always_show_bufferline = true,
    right_trunc_marker = '',
    show_close_icon = false,
    show_buffer_close_icons = false,
    show_tab_indicators = true,
    groups = {
      options = {
        toggle_hidden_on_enter = true -- when you re-enter a hidden group this options re-opens that group so the buffer is visible
      },
      require('bufferline.groups').builtin.pinned:with({ icon = "" }),
      items = {
        -- {
        --   name = "Html", -- Mandatory
        --   highlight = { gui = "undercurl", guisp = "blue" }, -- Optional
        --   auto_close = false, -- whether or not close this group if it doesn't contain the current buffer
        --   priority = 1, -- determines where it will appear relative to other groups (Optional)
        --   matcher = function(buf) -- Mandatory
        --     return buf.name:match('%.html')
        --   end,
        -- },
        -- {
        --   name = "Js",
        --   highlight = { gui = "undercurl", guisp = "purple" },
        --   auto_close = false, -- whether or not close this group if it doesn't contain the current buffer
        --   matcher = function(buf)
        --     return buf.name:match('%.js')
        --   end,
        --   priority = 2, -- determines where it will appear relative to other groups (Optional)
        -- },
        -- {
        --   name = "Css",
        --   highlight = { gui = "undercurl", guisp = "yellow" },
        --   auto_close = false, -- whether or not close this group if it doesn't contain the current buffer
        --   priority = 3, -- determines where it will appear relative to other groups (Optional)
        --   matcher = function(buf)
        --     return buf.name:match('%.css')
        --   end,
        -- },
        -- {
        --   name = "Python",
        --   priority = 4, -- determines where it will appear relative to other groups (Optional)
        --   highlight = { gui = "undercurl", guisp = "green" },
        --   auto_close = false, -- whether or not close this group if it doesn't contain the current buffer
        --   matcher = function(buf)
        --     return buf.name:match('%.py')
        --   end,
        -- },
        -- {
        --   name = "React",
        --   priority = 5, -- determines where it will appear relative to other groups (Optional)
        --   highlight = { gui = "undercurl", guisp = "Red" },
        --   auto_close = false, -- whether or not close this group if it doesn't contain the current buffer
        --   matcher = function(buf)
        --     return buf.name:match('%.jsx')
        --   end,
        -- },
      }
    }
  },
}
