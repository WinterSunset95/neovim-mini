vim.api.nvim_create_autocmd("FileType", {
  pattern = "svelte",
  group = vim.api.nvim_create_augroup("NativeTreesitterAttach", { clear = true }),
  callback = function(args)
    -- Vigorously force the native treesitter engine to start for this buffer
    vim.treesitter.start(args.buf, "svelte")
  end,
  desc = "Force native Treesitter attachment for Svelte",
})
