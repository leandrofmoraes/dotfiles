
local colors = {
    black  = '#080808',
    white  = '#c6c6c6',
    grey   = '#303030',
    yellow = "#ECBE7B",
    -- yellow = '#E4C079',
    -- cyan = "#008080",
    cyan   = '#79dac8',
    --cyan = "#78d4ed",
    -- darkblue = "#081633",
    -- green = "#98be65",
    -- green  = '#469C93', -- spotify green
    -- green = "#0BBD8A",
    -- green = "#12a7a7",
    green = "#008787",
    orange = "#FF8800",
    -- violet = "#a9a1e1",
    -- violet = '#d183e8',
    -- violet = '#BD93F9',
    -- magenta = "#c678dd",
    magenta = '#B542FF',
    -- purple = "#7123A6",
    -- purple =  '#310041', -- ubuntu purple
    dblue  = '#05142F',
    -- dblue  = '#000819',
    -- blue = "#51afef",
    --blue = "#2A7AE4",  -- Azul da Alura
    blue   = '#4799EB',
    -- red = "#ec5f67",
    -- red    = '#ff5189',
    --red = "#c84364",
    transparent = nil,
}
return {
    normal = {
        a = { fg = colors.dblue, bg = colors.blue, gui = "bold" },
        b = { fg = colors.blue, bg = colors.dblue },
        c = { fg = colors.blue, bg = colors.transparent },
    },
    insert = {
        a = { fg = colors.dblue, bg = colors.green, gui = "bold" },
        b = { fg = colors.green, bg = colors.dblue },
    },
    visual = {
        a = { fg = colors.dblue, bg = colors.yellow, gui = "bold" },
        b = { fg = colors.yellow, bg = colors.dblue },
    },
    command = {
        a = { fg = colors.dblue, bg = colors.magenta, gui = "bold" },
        b = { fg = colors.magenta, bg = colors.dblue },
    },
    inactive = {
        a = { fg = colors.blue, bg = colors.dblue, gui = "bold" },
        b = { fg = colors.dblue, bg = colors.blue },
        c = { fg = colors.dblue, bg = colors.transparent },
    }
}
