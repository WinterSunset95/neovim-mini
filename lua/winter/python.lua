local M = {}

local repl_state = {
  buf = nil,
  win = nil,
  job_id = nil,
}

local function open_ipython()
  -- If the window is already open and valid, do nothing
  if repl_state.win and vim.api.nvim_win_is_valid(repl_state.win) then
    return
  end

  -- Save where we came from
  local current_win = vim.api.nvim_get_current_win()

  -- Spawn vertical split on the far right
  vim.cmd("botright 60vsplit")
  repl_state.win = vim.api.nvim_get_current_win()

  -- If we already have a running REPL buffer, just attach it to the new window
  if repl_state.buf and vim.api.nvim_buf_is_valid(repl_state.buf) then
    vim.api.nvim_win_set_buf(repl_state.win, repl_state.buf)
  else
    -- Otherwise, create a new unlisted scratch buffer
    repl_state.buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_win_set_buf(repl_state.win, repl_state.buf)

    -- Start iPython, termopen returns the job_id we need to send data!
    repl_state.job_id = vim.fn.termopen("ipython")
  end

  vim.wo[repl_state.win].number = false
  vim.wo[repl_state.win].relativenumber = false
  vim.wo[repl_state.win].signcolumn = "no"
  vim.wo[repl_state.win].winfixwidth = true
  vim.wo[repl_state.win].spell = false

  vim.api.nvim_set_current_win(current_win)
end

local function send_text(text)
  if not repl_state.job_id then
    vim.notify("iPython REPL is not running. Did you close it?", vim.log.levels.ERROR)
    return
  end

  -- Neovim's channel API requires raw carriage returs for terminal execution
  local payload = "\27[200~" .. text .. "\27[201~\r\r"
  vim.api.nvim_chan_send(repl_state.job_id, payload)
end

local function send_line()
  local line = vim.api.nvim_get_current_line()
  send_text(line)
end

local function send_selection()
  local start_pos = vim.fn.getpos("v")
  local end_pos = vim.fn.getpos(".")

  local lines = vim.fn.getregion(start_pos, end_pos, { type = vim.fn.mode() })
  local text = table.concat(lines, "\r")

  send_text(text)

  local esc = vim.api.nvim_replace_termcodes("<Esc>", true, false, true)
  vim.api.nvim_feedkeys(esc, "n", false)
end

vim.api.nvim_create_autocmd('FileType', {
  pattern = "python",
  callback = function (opts)
    open_ipython()
    local map_opts = { buffer = opts.buf, silent = true, desc = "Send to iPython" }
    vim.keymap.set("n", "<leader>rr", send_line, map_opts)
    vim.keymap.set("v", "<leader>r", send_selection, map_opts)
  end
})

return M
