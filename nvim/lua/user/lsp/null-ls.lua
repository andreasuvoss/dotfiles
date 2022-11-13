local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
	return
end

local formatting = null_ls.builtins.formatting

null_ls.setup({
    sources = {
        formatting.prettier.with({ extra_args = { "--single-quote", } }),
        formatting.stylua,
        --null_ls.builtins.diagnostics.tsc,
        --null_ls.builtins.code_actions.eslint_d,
        --null_ls.builtins.formatting.stylua,
        --null_ls.builtins.completion.spell,
    }
})
