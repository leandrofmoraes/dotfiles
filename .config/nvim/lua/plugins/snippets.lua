local ls = require'luasnip'
local parse = ls.parser.parse_snippet
local d = ls.dynamic_node

local hash_include = [[
#include<stdio.h>
#include<stdlib.h>

int main() {
	${0:Noice}
}
]]

local html_bp = [[
<!DOCTYPE html>
<html lang="pt-br">

<head>
	<meta charset="utf-8">
	<meta name="viewport"
    content="width=device-width, initial-scale=1.0">
	<title>${1:TITLE}</title>
</head>
<body>
    ${0}
</body>
</html>
]]


local prints = {
	rust = [[println!("{${0}}");]],
	python = [[print(${0})]],
    java = [[System.out.println("${0}");]]
	javascript = [[console.log(${0});]],
	lua = [[print(${0})]],
	c = [[printf("${0}");]]
}

local formated_prints = {
    java = [[System.out.format("${0}");]],
    python = [[print(f'${0}')]],
}

ls.snippets = {
	-- all = {
		-- parse({trig="pp", wordTrig=true}, prints[vim.bo.ft] or ""),
	-- },

	python = {
		parse({trig="#!py", wordTrig=true}, "#!/usr/bin/env python3\n"),
		parse({trig="pp", wordTrig=true}, prints.python),
        parse({trig="prif", wordTrig=true}, formated_prints.python),
	},
    java = {
        parse({trig="soup", wordTrig=true}, prints.java),
        parse({trig="souf", wordTrig=true}, formated_prints.java),
    },
	rust = {
		parse({trig="pp", wordTrig=true}, prints.rust),
	},
	lua = {
		parse({trig="pp", wordTrig=true}, prints.lua),
	},
	javascript = {
		parse({trig="pp", wordTrig=true}, prints.javascript),
	},
	c = {
		parse({trig="#includec", wordTrig=true}, hash_include),
		parse({trig="pp", wordTrig=true}, prints.c),
	},
	html = {
		parse({trig="html!", wordTrig=true}, html_bp),
	}
}
