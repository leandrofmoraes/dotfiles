# Changelog

All notable changes to this project will be documented in this file.

## [1.1.1]

### <!-- 2 --> Bugfix

- Add tsx to treesitter ensure_installed list (#2268)
- Correct a path to bufferline module (#2270)

## [1.1.0]

### <!-- 1 --> Features

- _(vue)_ Set volar as default language server instead of vuels (#2230)
- Use schemastore.nvim to provide extended json schema support (#2239)
- Use bufferline instead of barbar (#2254)
- Add a minimal implementation of bbye (#2267)

### <!-- 2 --> Bugfix

- _(autopairs)_ Remove weird tex rules from autopairs (#2206)
- _(diag)_ Show lsp-diag code in open_float (#2180)
- _(installer)_ Usernames can contain @ symbol (#2167)
- _(installer)_ Universal bash (#2241)
- _(logging)_ Disable insane amount of logging inside lvim.log (#2205)
- _(lsp)_ No need to stop clients on LvimReload (#2160)
- _(lsp)_ Use temporary fork of lua-dev (#2187)
- _(lsp)_ Avoid accessing undefined user_data (#2216)
- _(lualine)_ Add space to diff components (#1897)
- _(lualine)_ Compacter size for treesitter icon (#2247)
- _(lualine)_ Use 1-char width symbol for changed (#2246)
- _(which-key)_ The PR has been merged to the original repo (#2172)
- _(zsh)_ Don't set filetype to sh (#2035)
- Added -ScriptBlock to run commands ```install.ps1``` (#2188)

### <!-- 3 --> Refactor

- _(nvim-tree)_ Cleanup and update settings (#2182)
- _(nvim-tree)_ Remove unused code (#2266)
- Remove unused outdated files (#2184)

### <!-- 4 --> Documentation

- _(readme)_ Add powershell installer script for Windows (#2208)

## [1.0.0]

### <!-- 1 --> Features

- _(info)_ Display overridden servers for filetype (#2155)
- _(luadev)_ Better vim api completion (#2043)
- Add lualine config for darkplus
- Last updates before 1.0.0 (#1953)
- Use Telescope's git_files with fallback (#2089)
- Plugin version bump (#2120)
- Lazyload notify's configuration (#1855)
- Plugin version bump (#2131)

### <!-- 2 --> Bugfix

- _(gitsigns)_ Rounded border (#2142)
- _(install)_ Avoid data-races for `on_packer_complete` (#2157)
- _(installer)_ Backup linked files with rsync (#2081)
- _(installer)_ Check if npm-prefix is writable (#2091)
- _(installer)_ More robust yarn validation (#2113)
- _(lsp)_ Set the handlers opts for v0.6 as well (#2109)
- _(lsp)_ Formatter now use new null-ls api function (#2135)
- _(lsp)_ Formatter now use new null-ls api function (#2135)
- _(null-ls)_ Avoid sending invalid opts.args (#2154)
- _(which-key)_ Temporary solution for which-key (#2150)
- Remove autopairs cmp completion (#2083)
- Remove "error" message from git tag (#2141)

### <!-- 3 --> Refactor

- _(bootstrap)_ More robust git module (#2127)
- _(info)_ Use new null-ls api for sources (#2125)
- _(install.sh)_ Fix typo in node error message (#2107)
- _(null-ls)_ Allow passing full list of options for sources (#2137)
- _(settings)_ Add headless-mode settings (#2134)
- _(term)_ Leave the first few ids unassigned (#2156)
- _(test)_ Cleanup test utilities (#2132)
- Deprecate lvim.lang.FOO (#1913) (#1914)
- Remove unused old language configs (#2094)
- Uplift neovim's minimum version requirement to 0.6.0 (#2093)
- Avoid running ts.setup in headless (#2119)
- More consistent autocmds (#2133)
- Use a static lvim binary template (#1444)

## [1.0.0-rc]

### <!-- 1 --> Features

- _(installer)_ Nicer rsync output (#2067)
- _(terminal)_ Lazygit can now be toggled (#2039)
- Add lualine config for darkplus
- Last updates before 1.0.0 (#1953)
- Support new null-ls (#1955)
- Empty for empty buffers instead of Buffer <#>
- Improved LSP grouping in lualine
- Decrease hide in width limit for lualine
- Add support for fsharp (#2021)
- Add some messages in uninstall.sh (#1945)
- Null-ls code_actions interface (#2008)
- Full compatibility with neovim v0.6 (#2037)
- Multiple enhancements to lvim-reload (#2054)
- Bump plugin versions (#2064)
- Update lsp-installer and lspconfig hashes to enable solidity_ls language server (#2072)

### <!-- 2 --> Bugfix

- _(autopairs)_ Add missing configuration entries (#2030)
- _(bootstrap)_ Remove hard-coded spellfile option (#2061)
- _(cmp)_ Revert broken sequential loading (#2002)
- _(installer)_ Better handling of existing files (#2066)
- _(lsp)_ Avoid installing an overridden server (#1981)
- _(lsp)_ Prevent repeated setup call (#2048)
- _(lsp)_ Correct client_id parsing in lvim-info (#2071)
- _(lsp)_ Allow overriding servers with custom providers (#2070)
- _(lualine)_ Change `fg` of section `a` in onedarker (#1909)
- _(null-ls)_ Allow the same linter and formatter (#1968)
- _(nvimtree)_ Update settings (#2001)
- _(nvimtree)_ Restore default mappings + make them customizable (#2007)
- _(nvimtree)_ Handle paths containing spaces (#2027)
- _(plugins)_ Typo of pin commit of `treesitter` (#2046)
- _(terminal)_ Allow disabling the open binding for toggleterm
- _(windows)_ Autocmd requires forward slashes (#1967)
- _(windows)_ Remove redundant `resolve` call (#1974)
- Bump nvim-tree version
- Formatting
- Remove duplicate lint messages
- Allow LunarVim changelog to work outside the lvim directory (#1952)
- Use an indepdent shadafile from neovim (#1910)
- Packersync issue when you have large number of plugins (#1922)
- No idea why this breaks barbar
- Lsp root can get very annoying when working with multiple languages. User is still able to turn it on.
- Update jdtls script
- Correct order for cmp's setup (#1999)
- Dont close if next char is a close pair and no pairs in same line (#2017)
- More accessible changelog (#2019)
- Better default, ignore `.git` in `live_grep` (#2020)
- No restart required when changing colorscheme (#2026)
- No longer treat lazygit missing as an error (#2051)

### <!-- 3 --> Refactor

- Deprecate lvim.lang.FOO (#1913) (#1914)
- More configurable format-on-save (#1937)
- Load the default keymaps once (#1965)

<!-- generated by git-cliff -->
