return {
  'numToStr/Navigator.nvim',
  config = function() require('Navigator').setup() end,
  cmd = {
    'NavigatorLeft',
    'NavigatorDown',
    'NavigatorUp',
    'NavigatorRight',
    'NavigatorPrevious',
  },
  keys = {
    { '<c-h>', '<CMD>NavigatorLeft<CR>' },
    { '<c-j>', '<CMD>NavigatorDown<CR>' },
    { '<c-k>', '<CMD>NavigatorUp<CR>' },
    { '<c-l>', '<CMD>NavigatorRight<CR>' },
    { '<c-\\>', '<CMD>NavigatorPrevious<CR>' },
  },
}
