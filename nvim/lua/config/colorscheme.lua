local present, catppuccin = pcall(require, "catppuccin")
if not present then
  return
end

local c = require("catppuccin.colors").setup()

-- ╭──────────────────────────────────────────────────────────╮
-- │ Setup Colorscheme                                        │
-- ╰──────────────────────────────────────────────────────────╯
catppuccin.setup({
  flavour = "macchiato",  -- Choisissez parmi les différentes variantes (latte, frappe, macchiato, mocha)
  transparent_background = vim.g.neovide and true or false, -- Si vous souhaitez un fond transparent
  terminal_colors = true,  -- Configure les couleurs utilisées pour le terminal dans Neovim
  styles = {
    comments = "italic",   -- Appliquer un style italique aux commentaires
    keywords = "bold",     -- Appliquer un style gras aux mots-clés
    functions = "italic",  -- Style pour les fonctions
    variables = "NONE",    -- Pas de style particulier pour les variables
    sidebars = "dark",     -- Style pour les barres latérales
    floats = "dark",       -- Style pour les fenêtres flottantes
  },
  sidebars = { "qf", "help", "snacks_layout_box", "snacks_picker_list" },  -- Configurer les fenêtres latérales comme qf, help, etc.
  dim_inactive = false,  -- Empêcher la réduction de la luminosité des fenêtres inactives
  lualine_bold = false,  -- Désactiver le texte en gras dans la ligne de statut avec lualine
  cache = true,          -- Activer le cache pour de meilleures performances
  plugins = {
    all = package.loaded.lazy == nil, -- Activer tous les plugins si lazy.nvim n'est pas utilisé
    auto = true,           -- Activer automatiquement les plugins requis
  },
  on_colors = function(colors)
    colors.border = "#1A1B26"
  end,
  on_highlights = function(hl, _color)
    local prompt = "#FFA630"
    local text = "#488dff"
    local none = "None"

    hl.TelescopeTitle = {
      fg = prompt,
      bg = none,
    }
    hl.TelescopeNormal = {
      bg = none,
      fg = none,
    }
    hl.TelescopeBorder = {
      bg = none,
      fg = none,
    }
    hl.TelescopeMatching = {
      fg = prompt,
      bg = none,
    }
    hl.MsgArea = {
      fg = c.fg_dark,
    }
  end,
})

-- Configuration des highlights (couleurs personnalisées)
local highlights = {
  EcovimPrimary = { fg = "#488dff" },
  EcovimSecondary = { fg = "#FFA630" },
  -- Ajoutez d'autres couleurs personnalisées ici si nécessaire
}

for group, hl in pairs(highlights) do
  vim.api.nvim_set_hl(0, group, hl)
end

-- Configuration spécifique à Neovide
local neovide_highlights = {
  -- Exemple de personnalisation pour Neovide
}

if vim.g.neovide then
  for group, hl in pairs(neovide_highlights) do
    vim.api.nvim_set_hl(0, group, hl)
  end
end

