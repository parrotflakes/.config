return {

   {
      "godlygeek/tabular",
      ft = { "markdown" },
   },

   {
      "preservim/vim-markdown",
      ft = { "markdown" },
      config = function()
         vim.opt.conceallevel = 0
         -- vim.g["vim_markdown_folding_disabled"] = 0
         -- vim.g["vim_markdown_folding_level"] = 3
      end
   },

   -- preview in web browser
   {
      "iamcco/markdown-preview.nvim",
      ft = { "markdown" },
      run = "cd app && npm install",
      init = function()
         vim.g.mkdp_filetypes = { "markdown" }
      end,
      ft = { "markdown" }
   },

}