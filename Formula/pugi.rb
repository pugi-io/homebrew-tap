# Written by the @pugi/cli release (pugi-core packages/opencode/script/pugi-homebrew.ts).
# Do not edit by hand: the next release overwrites this file.
class Pugi < Formula
  desc "Pugi CLI - terminal-native AI software execution"
  homepage "https://pugi.io"
  version "1.0.0-alpha.248"
  license "MIT"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@pugi/cli-darwin-arm64/-/cli-darwin-arm64-1.0.0-alpha.248.tgz"
      sha256 "b9ed2ab00a649bf5166f785ecc514224ef711751b1a5be40266efbf55df7c81a"
    end
    on_intel do
      url "https://registry.npmjs.org/@pugi/cli-darwin-x64/-/cli-darwin-x64-1.0.0-alpha.248.tgz"
      sha256 "83e2a4843894242693589a8a18d72ffe7be443a6bc8d2af2b60956d8d15fe68a"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@pugi/cli-linux-arm64/-/cli-linux-arm64-1.0.0-alpha.248.tgz"
      sha256 "5c4d6227e4a3af5ca873d7d2567cad5c67bcebd96549c58748b2d807d20f5de1"
    end
    on_intel do
      url "https://registry.npmjs.org/@pugi/cli-linux-x64/-/cli-linux-x64-1.0.0-alpha.248.tgz"
      sha256 "bc087ee525a9b1049de33316fbd13b787923c9877fff69ebbb73c34a7d736f1b"
    end
  end

  # The persona skill pack ships in the npm wrapper package, not in the binary.
  resource "skills" do
    url "https://registry.npmjs.org/@pugi/cli/-/cli-1.0.0-alpha.248.tgz"
    sha256 "0f091ca8ec8d1f1d48ede0fe188512cc2a24713877a8c19b00228c9a4bfe6ff3"
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
