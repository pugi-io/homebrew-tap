# Written by the @pugi/cli release (pugi-core packages/opencode/script/pugi-homebrew.ts).
# Do not edit by hand: the next release overwrites this file.
class Pugi < Formula
  desc "Pugi CLI - terminal-native AI software execution"
  homepage "https://pugi.io"
  version "1.0.0-alpha.252"
  license "MIT"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@pugi/cli-darwin-arm64/-/cli-darwin-arm64-1.0.0-alpha.252.tgz"
      sha256 "4cd0ebcb4f1c93e9d6a8784d5f09a0533cc769dfe4e80815cf25c96e49d35796"
    end
    on_intel do
      url "https://registry.npmjs.org/@pugi/cli-darwin-x64/-/cli-darwin-x64-1.0.0-alpha.252.tgz"
      sha256 "2f43df7b7ac6c8c83dc0603c54bcd2a8fa5bc4d002e9d8a004195fbfc6be595e"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@pugi/cli-linux-arm64/-/cli-linux-arm64-1.0.0-alpha.252.tgz"
      sha256 "4b1d021575e2d517d67b519f003ec7c61d50f0d8505f9008e5ca40416c74c8c8"
    end
    on_intel do
      url "https://registry.npmjs.org/@pugi/cli-linux-x64/-/cli-linux-x64-1.0.0-alpha.252.tgz"
      sha256 "a24622c2f5107d607a366cce7b2d2e9dee3ec34631c9fcba3077cc305e45326e"
    end
  end

  # The persona skill pack ships in the npm wrapper package, not in the binary.
  resource "skills" do
    url "https://registry.npmjs.org/@pugi/cli/-/cli-1.0.0-alpha.252.tgz"
    sha256 "2e7770c3bd7d705db063b50f25b4d85a1b79b5c2b4d91363b4c2d27eefc5a5b4"
  end

  def install
    # The binary finds the skill pack at <its dir>/../skills, so both live in
    # libexec and bin/ gets a wrapper script that execs the real path.
    libexec.install "bin"
    resource("skills").stage { libexec.install "skills" }
    # write_exec_script treats its receiver as a directory: bin/pugi.
    bin.write_exec_script libexec/"bin/pugi"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pugi --version")
  end
end
