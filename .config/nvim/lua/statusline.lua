local gl = require('galaxyline')
local condition = require('galaxyline.condition')
local gls = gl.section

local colors = {
  -- bg = "NONE",
  bg = "#2E3440",
  fg = "#65737e",
  line_bg = "NONE",
  lbg = "#3B4252",
  fg_green = "#8FBCBB",
  yellow = "#EBCB8B",
  cyan = "#A3BE8C",
  darkblue = "#81A1C1",
  green = "#8FBCBB",
  orange = "#D08770",
  purple = "#B48EAD",
  magenta = "#BF616A",
  gray = "#65737e",
  blue = "#5E81AC",
  red = "#BF616A"
}


local mode_color = function()
  local mode_colors = {
    n = colors.cyan,
    i = colors.green,
    c = colors.orange,
    V = colors.magenta,
    [''] = colors.magenta,
    v = colors.magenta,
    R = colors.red,
  }

  local color = mode_colors[vim.fn.mode()]

  if color == nil then
    color = colors.red
  end

  return color
end

gls.left[2] = {
  ViMode = {
    provider = function()
      local alias = {
        n = 'NORMAL',
        i = 'INSERT',
        c = 'COMMAND',
        V = 'VISUAL',
        [''] = 'VISUAL',
        v = 'VISUAL',
        R = 'REPLACE',
        t = 'TERMINAL',
      }
      vim.api.nvim_command('hi GalaxyViMode guifg='..mode_color())
      local alias_mode = alias[vim.fn.mode()]
      if alias_mode == nil then
        alias_mode = vim.fn.mode()
      end
      return alias_mode..' '
    end,
    highlight = { colors.bg, colors.bg },
    separator = "",
    separator_highlight = {colors.bg, colors.section_bg},
  },
}

gls.left[4] = {
  GitBranch = {
    provider = 'GitBranch',
    separator = ' ',
    condition = condition.check_git_workspace,
    highlight = {colors.violet,colors.bg,'bold'},
    highlight = {colors.fg,colors.bg,'bold'}
  }
}

gls.left[5] = {
  FileName = {
    provider = 'FileName',
    condition = condition.buffer_not_empty,
    highlight = {colors.fg,colors.bg,'bold'}
  }
}

gls.left[6] = {
  LineInfo = {
    provider = 'LineColumn',
    separator = '',
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.fg,colors.bg},
  },
}

gls.left[8] = {
  DiagnosticError = {
    provider = 'DiagnosticError',
    icon = '  ',
    highlight = {colors.red,colors.bg}
  }
}
gls.left[9] = {
  DiagnosticWarn = {
    provider = 'DiagnosticWarn',
    icon = '  ',
    highlight = {colors.yellow,colors.bg},
  }
}

gls.left[10] = {
  DiagnosticHint = {
    provider = 'DiagnosticHint',
    icon = '  ',
    highlight = {colors.cyan,colors.bg},
  }
}

gls.left[11] = {
  DiagnosticInfo = {
    provider = 'DiagnosticInfo',
    icon = '  ',
    highlight = {colors.blue,colors.bg},
  }
}

gls.right[8] = {
  ShowLspClient = {
    provider = 'GetLspClient',
    separator = ' ',
    condition = function ()
      local tbl = {['dashboard'] = true,['']=true}
      if tbl[vim.bo.filetype] then
        return false
      end
      return true
    end,
    separator = ' ',
    highlight = {colors.fg,colors.bg,'bold'}
  }
}

gls.short_line_left[1] = {
  BufferType = {
    provider = 'FileTypeName',
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.fg,colors.bg,'bold'}
  }
}

gls.short_line_left[2] = {
  SFileName = {
    provider =  'SFileName',
    condition = condition.buffer_not_empty,
    highlight = {colors.fg,colors.bg,'bold'}
  }
}

gls.short_line_right[1] = {
  BufferIcon = {
    provider= 'BufferIcon',
    highlight = {colors.fg,colors.bg}
  }
}