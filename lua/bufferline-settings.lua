require("bufferline").setup{
  options = {
    mode = "buffers", -- set to "tabs" to only show tabpages instead
    themable = true, -- allows highlight groups to be overriden i.e. sets highlights as default
    numbers = "ordinal",
      close_command = "bdelete! %d",       -- can be a string | function, | false see "Mouse actions"
      right_mouse_command = "bdelete! %d"  -- can be a string | function | false, see "Mouse actions"
    }
  }

