# Written by the @pugi/cli release (pugi-core packages/opencode/script/pugi-homebrew.ts).
# Do not edit by hand: the next release overwrites this file.
class Pugi < Formula
  desc "Pugi CLI - terminal-native AI software execution"
  homepage "https://pugi.io"
  version "1.0.0-alpha.241"
  license "MIT"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@pugi/cli-darwin-arm64/-/cli-darwin-arm64-1.0.0-alpha.241.tgz"
      sha256 "3dbb22df3807eea921250c12558644616967f0637e26c61aec9a1947d3287b61"
    end
    on_intel do
      url "https://registry.npmjs.org/@pugi/cli-darwin-x64/-/cli-darwin-x64-1.0.0-alpha.241.tgz"
      sha256 "123169fb8064b63c50486c8e2dd77fd4d5c1df6250762f613232cf6ed55a42cb"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@pugi/cli-linux-arm64/-/cli-linux-arm64-1.0.0-alpha.241.tgz"
      sha256 "96ea86d96764e12a7529d622e7af888e1c7eb54bf241f199dc939d16138cbb5d"
    end
    on_intel do
      url "https://registry.npmjs.org/@pugi/cli-linux-x64/-/cli-linux-x64-1.0.0-alpha.241.tgz"
      sha256 "46f43f10bffc616d9cb5ca43e8f6743eb95dfecdc61d2b044b1ae309443bdda8"
    end
  end

  # The persona skill pack ships in the npm wrapper package, not in the binary.
  resource "skills" do
    url "https://registry.npmjs.org/@pugi/cli/-/cli-1.0.0-alpha.241.tgz"
    sha256 "bfa9f255a6f74c17f671fb85abcf6f80e880488996b2086c38a3ba7e32c6f8df"
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
