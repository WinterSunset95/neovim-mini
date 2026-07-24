 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#131315',
    base01 = '#201f21',
    base02 = '#2a2a2b',
    base03 = '#909097',
    base04 = '#c7c5cd',
    base05 = '#e5e1e4',
    base06 = '#e5e1e4',
    base07 = '#e5e1e4',
    base08 = '#ffb4ab',
    base09 = '#dfbdd3',
    base0A = '#c6c5d2',
    base0B = '#c1c5e1',
    base0C = '#dfbdd3',
    base0D = '#c1c5e1',
    base0E = '#c6c5d2',
    base0F = '#93000a',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  hi('TelescopeNormal',         { fg = '#e5e1e4',          bg = '#131315' })
  hi('TelescopeBorder',         { fg = '#909097',             bg = '#131315' })
  hi('TelescopePromptNormal',   { fg = '#e5e1e4',          bg = '#131315' })
  hi('TelescopePromptBorder',   { fg = '#909097',             bg = '#131315' })
  hi('TelescopePromptPrefix',   { fg = '#c1c5e1',             bg = '#131315' })
  hi('TelescopePromptCounter',  { fg = '#c7c5cd',  bg = '#131315' })
  hi('TelescopePromptTitle',    { fg = '#131315',             bg = '#c1c5e1' })
  hi('TelescopePreviewTitle',   { fg = '#131315',             bg = '#c6c5d2' })
  hi('TelescopeResultsTitle',   { fg = '#131315',             bg = '#dfbdd3' })
  hi('TelescopeSelection',      { fg = '#e5e1e4',          bg = '#2a2a2b' })
  hi('TelescopeSelectionCaret', { fg = '#c1c5e1',             bg = '#2a2a2b' })
  hi('TelescopeMatching',       { fg = '#c1c5e1',             bold = true })
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
