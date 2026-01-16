return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {

    interactions = {
      chat = {
        adapter = "opencode", -- Changed from "opencode"
      },
    },

 },
}
