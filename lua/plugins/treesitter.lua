require'nvim-treesitter.configs'.setup {
  ensure_installed = { 
      "vim", 
      "rust", 
      "lua", 
      "javascript", 
      "typescript", 
      "vue", 
      "css", 
      "json", 
      "python",
  },
  highlight = {
    enable = true,
  },
  rainbow = {
      enable = true,
      extended_mode = true,
      max_file_lines = nil,
  },
}
