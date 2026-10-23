# Written by the @pugi/cli release (pugi-core packages/opencode/script/pugi-homebrew.ts).
# Do not edit by hand: the next release overwrites this file.
class Pugi < Formula
  desc "Pugi CLI - terminal-native AI software execution"
  homepage "https://pugi.io"
  version "1.0.0-alpha.245"
  license "MIT"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@pugi/cli-darwin-arm64/-/cli-darwin-arm64-1.0.0-alpha.245.tgz"
      sha256 "a74d2a29e03ed87739a59716dd46ee2245d715ffde50875997dd130d2c872a4e"
    end
    on_intel do
      url "https://registry.npmjs.org/@pugi/cli-darwin-x64/-/cli-darwin-x64-1.0.0-alpha.245.tgz"
      sha256 "7a056616f669adf6219a724d0c2456bfce0403c4cf2c2662a574d08e0a834e84"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@pugi/cli-linux-arm64/-/cli-linux-arm64-1.0.0-alpha.245.tgz"
      sha256 "bb306cf06a259d55bb4b975950301fc267c9b6e5b7c3963225e56a6bbe253363"
    end
    on_intel do
      url "https://registry.npmjs.org/@pugi/cli-linux-x64/-/cli-linux-x64-1.0.0-alpha.245.tgz"
      sha256 "83b187a94aad7cff4cc2e730dfa392f14e7496fe79bf8af8536f7c8304a52187"
    end
  end

  # The persona skill pack ships in the npm wrapper package, not in the binary.
  resource "skills" do
    url "https://registry.npmjs.org/@pugi/cli/-/cli-1.0.0-alpha.245.tgz"
    sha256 "84dbf7b55f523a3e4a08b2519446b56c98839605aeadf87d3a9cd758b918a13f"
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
