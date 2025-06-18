return {
  "itchyny/lightline.vim",
  lazy = false,
  config = function()
    vim.o.laststatus = 2
    vim.o.showmode = false
    vim.g.lightline = {
      colorscheme = 'solarized',
    }
  end
}
