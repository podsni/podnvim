# Repository Guidelines

## Project Structure & Module Organization
- `init.lua` bootstraps `lazy.nvim`, wires the runtime path, and loads the local modules that shape the editor experience.
- Core settings live in `lua/set.lua` and key mappings in `lua/remap.lua`; keep feature-specific logic out of these baseline files.
- Plugin specs sit under `lua/plugins/`, one module per integration (for example `treesitter.lua`, `git-stuff.lua`, `harpoon2.lua`) returning the Lazy configuration table; follow the existing lowercase, hyphenated filenames.
- `lazy-lock.json` pins plugin versions: update it only through Lazy commands so that collaborators stay on compatible revisions.

## Build, Test, and Development Commands
- `nvim --headless "+Lazy sync" +qa` installs or updates plugins and refreshes `lazy-lock.json`; run after editing specs.
- `nvim --headless -c "checkhealth" -c "qa"` validates core tooling (LSP, formatters, debuggers) and catches missing dependencies early.
- `nvim --headless "+lua vim.cmd('source init.lua')" +qa` sanity-checks that the configuration parses without starting a UI session.

## Coding Style & Naming Conventions
- Lua files use two-space indentation (`tabstop`, `shiftwidth`, and `softtabstop` are set to 2) and avoid hard tabs.
- Prefer double-quoted strings and trailing commas in tables, matching existing plugin specs for clean diffs.
- For formatting, rely on `stylua` (available via `none-ls` and LSP formatting) before submitting changes; do not hand-edit lockfiles.
- Expose helper modules under `lua/` with concise names, and keep plugin-specific utilities scoped near their specs to limit the global namespace.

## Testing Guidelines
- Add or adjust keymaps/features with accompanying manual checks: open Neovim, trigger the mapping, and confirm no conflicts are reported in `:map`.
- Use `:Lazy health` and `:checkhealth` for regression smoke tests whenever dependencies or diagnostics tooling change.
- When altering LSP or formatter settings, validate by opening a representative project file and running `:lua vim.lsp.buf.format()` for direct feedback.

## Commit & Pull Request Guidelines
- Recent history favors short, lowercase messages such as `update`; keep messages imperative but expand them to specify what changed (e.g. `feat: add rust tooling`).
- Reference related issues in the body, describe user-visible effects, and mention any follow-up tasks.
- For pull requests, include reproduction or validation steps (commands above), note plugin migrations, and attach screenshots when the change is visual.

## Configuration Tips
- Avoid committing machine-specific secrets; use local environment variables for API tokens referenced by plugins.
- When experimenting, isolate temporary code under `lua/plugins/TODO.lua` or a local branch so production startup remains stable.
