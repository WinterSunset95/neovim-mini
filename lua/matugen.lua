 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#141316',
    base01 = '#201f22',
    base02 = '#2a292c',
    base03 = '#928f99',
    base04 = '#c9c5cf',
    base05 = '#e5e1e5',
    base06 = '#e5e1e5',
    base07 = '#e5e1e5',
    base08 = '#ffb4ab',
    base09 = '#fcc5e4',
    base0A = '#c8c4d8',
    base0B = '#d6cffe',
    base0C = '#ecb7d6',
    base0D = '#c7c1ef',
    base0E = '#c8c4d8',
    base0F = '#93000a',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  hi('TelescopeNormal',         { fg = '#e5e1e5',          bg = '#141316' })
  hi('TelescopeBorder',         { fg = '#928f99',             bg = '#141316' })
  hi('TelescopePromptNormal',   { fg = '#e5e1e5',          bg = '#141316' })
  hi('TelescopePromptBorder',   { fg = '#928f99',             bg = '#141316' })
  hi('TelescopePromptPrefix',   { fg = '#d6cffe',             bg = '#141316' })
  hi('TelescopePromptCounter',  { fg = '#c9c5cf',  bg = '#141316' })
  hi('TelescopePromptTitle',    { fg = '#141316',             bg = '#d6cffe' })
  hi('TelescopePreviewTitle',   { fg = '#141316',             bg = '#c8c4d8' })
  hi('TelescopeResultsTitle',   { fg = '#141316',             bg = '#fcc5e4' })
  hi('TelescopeSelection',      { fg = '#e5e1e5',          bg = '#2a292c' })
  hi('TelescopeSelectionCaret', { fg = '#d6cffe',             bg = '#2a292c' })
  hi('TelescopeMatching',       { fg = '#d6cffe',             bold = true })
end

 -- Register a signal handler for SIGUSR1 (matugen updates)
 local signal = vim.uv.new_signal()
 signal:start(
   'sigusr1',
   vim.schedule_wrap(function()
     package.loaded['matugen'] = nil
     require('matugen').setup()
   end)
 )

 return M
