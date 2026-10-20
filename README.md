# homebrew-tap

Homebrew tap for [Pugi](https://pugi.io) - terminal-native AI software execution.

## Install Pugi CLI

```bash
brew install pugi-io/tap/pugi
pugi --version
```

Recent Homebrew versions ask you to trust a third-party tap before they use
it. If `brew install` says the tap is not trusted:

```bash
brew trust --formula pugi-io/tap/pugi
```

The formula installs the native `pugi` binary for your platform (macOS or
Linux, arm64 or x64) and the persona skill pack, straight from the published
`@pugi/cli` npm packages. It does not need Node.js.

## Upgrading

```bash
pugi upgrade          # runs brew upgrade pugi-io/tap/pugi on a Homebrew install
```

or `brew upgrade pugi-io/tap/pugi`.

## Updating the formula

`Formula/pugi.rb` is written by the `@pugi/cli` release itself: after npm
`latest` moves, the release script in pugi-core
(`packages/opencode/script/pugi-release-steps.ts`, step `homebrew-formula`,
formula rendered by `script/pugi-homebrew.ts`) computes the sha256 of every
platform tarball and commits the new formula to `main`. Do not edit it by hand;
the next release overwrites it.
