# Prerequisites

## Treesitter

For treesitter to work, we'll need to have C compiler installed

## Telescope

[BurntSushi/ripgrep](https://github.com/BurntSushi/ripgrep) is required for live_grep and grep_string and is the first priority for find_files

## Formatting with csharpier

`csharpier` takes values from .editorconfig.
For csharpier to work with formatting:

1. Install csharpier `dotnet tool install -g csharpier`
2. If after install `csharpier` command is not working, insert `%USERPROFILE%\.dotnet\tools` to environment variables -> PATH
