# homebrew-tap

Homebrew tap for [Pugi](https://pugi.io) - terminal-native AI software execution.

## Install Pugi CLI

```bash
brew install pugi-io/tap/pugi
pugi --version
```

The formula installs the `pugi` binary from the published `@pugi/cli` npm package and depends on `node@20`.

## Updating the formula

The formula is bumped automatically on every successful `@pugi/cli` npm publish by the `update-homebrew-tap` workflow in [pugi-io/pugi](https://github.com/pugi-io/pugi). Manual edits to `Formula/pugi.rb` are not normally needed.
