# Features Research: Neovim Productivity Configuration

> Researched: 2026-05-15

## Table Stakes (Must Have — Users Expect These)

### Per-Language Support
- LSP with autocomplete, go-to-definition, references, rename
- Treesitter syntax highlighting
- Format-on-save with language-appropriate formatter
- Linting with inline diagnostics

### Editor Core
- File tree browser (Neo-tree / Snacks explorer)
- Fuzzy file finder and grep (Snacks picker)
- Git integration (signs, blame, diff, hunks)
- Session persistence
- Terminal integration
- Keymap discovery (which-key)
- Diagnostics list (Trouble)

### Code Intelligence
- Auto-completion with multiple sources (LSP, snippets, path, buffer)
- Snippet support
- Auto-pairs (brackets, quotes)
- Auto-tags (HTML/JSX)
- Surround operations
- Text objects (function, class, parameter)

### Documentation
- README with installation instructions
- Plugin list with descriptions
- Keybinding reference
- Screenshots or demo GIFs

## Differentiators (Competitive Advantage)

### Debugging Integration
- Full DAP support with breakpoints, stepping, variable inspection
- Virtual text showing variable values during debug
- Language-specific debug helpers (nvim-dap-python, nvim-jdtls)
- VSCode launch.json compatibility

### AI-Assisted Coding
- Copilot integration with completion engine
- AI chat via terminal (aichat)
- Ghost text suggestions

### Multi-Language Support
- Dedicated config per language (langs/ directory pattern)
- Language-specific keymaps registered via which-key
- Multiple JDK runtimes for Java (mise integration)

### Performance
- Sub-100ms startup with proper lazy loading
- Rust-based completion engine (blink.cmp)
- Efficient Treesitter with on-demand parser loading

### Documentation Quality
- Bilingual documentation (EN + pt-BR)
- Full keybind reference table
- Architecture diagram
- Contributing guide

## Anti-Features (Deliberately NOT Building)

| Feature | Reason |
|---------|--------|
| Embedded web browser | Complexity, out of scope for text editor |
| Database client | Use dedicated tools (DataGrip, DBeaver) |
| Email/chat client | Scope creep |
| Plugin marketplace UI | Mason already handles this |
| Custom theme creation | Use existing mature themes |
