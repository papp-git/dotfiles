require("nvim-tree").setup(
{
filters = {
        dotfiles = false,
        git_clean = false,
        no_buffer = false,
        custom = { '*.pdf', '*.gz' },
    },
}
)
