-- Create annotations with one keybind, and jump your cursor in the inserted annotation
return {
  "danymat/neogen",
  keys = {
    {
      "<leader>n",
      function()
        require("neogen").generate({})
      end,
      desc = "Neogen Comment",
    },
  },
  opts = { snippet_engine = "luasnip" },
}
