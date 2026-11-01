# Written by the @pugi/cli release (pugi-core packages/opencode/script/pugi-homebrew.ts).
# Do not edit by hand: the next release overwrites this file.
class Pugi < Formula
  desc "Pugi CLI: an AI product team in your terminal"
  homepage "https://pugi.io"
  version "1.0.0-alpha.258"
  license "MIT"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@pugi/cli-darwin-arm64/-/cli-darwin-arm64-1.0.0-alpha.258.tgz"
      sha256 "e67185c53a55684a0fbe44342c74cd65870c832e80fd76207d58c6a63625bd08"
    end
    on_intel do
      url "https://registry.npmjs.org/@pugi/cli-darwin-x64/-/cli-darwin-x64-1.0.0-alpha.258.tgz"
      sha256 "4961d2712a307b2f16e4ce7311007fc4df1d7c994af259ccfd81e90e8a02fc73"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@pugi/cli-linux-arm64/-/cli-linux-arm64-1.0.0-alpha.258.tgz"
      sha256 "745401a2a21882ad095b24b41e20c063bcd82fdfbff768b2d9eb5b6e2271569f"
    end
    on_intel do
      url "https://registry.npmjs.org/@pugi/cli-linux-x64/-/cli-linux-x64-1.0.0-alpha.258.tgz"
      sha256 "cca5abf1d16de003705196e0d45377d9481c81d9b0cc123998eef61cc0c6e4d7"
    end
  end

  # The persona skill pack ships in the npm wrapper package, not in the binary.
  resource "skills" do
    url "https://registry.npmjs.org/@pugi/cli/-/cli-1.0.0-alpha.258.tgz"
    sha256 "854e288d37b82d27a891e3db67f526423d551d6113850920b5b39f2c6a7bf978"
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
