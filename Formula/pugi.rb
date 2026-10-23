# Written by the @pugi/cli release (pugi-core packages/opencode/script/pugi-homebrew.ts).
# Do not edit by hand: the next release overwrites this file.
class Pugi < Formula
  desc "Pugi CLI - terminal-native AI software execution"
  homepage "https://pugi.io"
  version "1.0.0-alpha.246"
  license "MIT"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@pugi/cli-darwin-arm64/-/cli-darwin-arm64-1.0.0-alpha.246.tgz"
      sha256 "2e6b8032d5376dfa1cbf9a42e54fdfcf2c078bc7be58f0400f3c680a84c20bac"
    end
    on_intel do
      url "https://registry.npmjs.org/@pugi/cli-darwin-x64/-/cli-darwin-x64-1.0.0-alpha.246.tgz"
      sha256 "a1852c9f148e5d9b9be3b2b18a1dd889bf33641231fb0d1b705e309fbffe8668"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@pugi/cli-linux-arm64/-/cli-linux-arm64-1.0.0-alpha.246.tgz"
      sha256 "e06be2109e9331d443a843e984d2fe3bdf895f4486ffebfc284b57956b985b7c"
    end
    on_intel do
      url "https://registry.npmjs.org/@pugi/cli-linux-x64/-/cli-linux-x64-1.0.0-alpha.246.tgz"
      sha256 "0559a2d0d4d515e06e550fab66d1176a3f335ef041fd91a25e5b20fd58202265"
    end
  end

  # The persona skill pack ships in the npm wrapper package, not in the binary.
  resource "skills" do
    url "https://registry.npmjs.org/@pugi/cli/-/cli-1.0.0-alpha.246.tgz"
    sha256 "9b8c09c2746973bd2e35879f2f9a87a9c4535d6e629ff62f9259f3bcbdf8507f"
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
