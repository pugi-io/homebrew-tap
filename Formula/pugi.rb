# Written by the @pugi/cli release (pugi-core packages/opencode/script/pugi-homebrew.ts).
# Do not edit by hand: the next release overwrites this file.
class Pugi < Formula
  desc "Pugi CLI: an AI product team in your terminal"
  homepage "https://pugi.io"
  version "1.0.0-alpha.263"
  license "MIT"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@pugi/cli-darwin-arm64/-/cli-darwin-arm64-1.0.0-alpha.263.tgz"
      sha256 "9c562b8ea9025a57294dc64aefca30b1d4480856fe662757e9ee1b61cbc5ce16"
    end
    on_intel do
      url "https://registry.npmjs.org/@pugi/cli-darwin-x64/-/cli-darwin-x64-1.0.0-alpha.263.tgz"
      sha256 "7e711828ae9cfa7ead4d3cd7571a30b4f0f9614605a4c6cd5cc92850ef79668d"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@pugi/cli-linux-arm64/-/cli-linux-arm64-1.0.0-alpha.263.tgz"
      sha256 "6da531f30a5900ebe7eb69e8c3dc68b11c66876189b7b3b6af2883f2ef27f8dd"
    end
    on_intel do
      url "https://registry.npmjs.org/@pugi/cli-linux-x64/-/cli-linux-x64-1.0.0-alpha.263.tgz"
      sha256 "a00115c8f5294587131146a977a23ee98fe64cc923bc4a2abc3b8fbf435bf9c7"
    end
  end

  # The persona skill pack ships in the npm wrapper package, not in the binary.
  resource "skills" do
    url "https://registry.npmjs.org/@pugi/cli/-/cli-1.0.0-alpha.263.tgz"
    sha256 "1b66e09bc1fefe3a945c0bf2d05a63736127618b2c799fdd77db95ebdd3a43b7"
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
