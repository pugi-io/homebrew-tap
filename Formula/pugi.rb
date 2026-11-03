# Written by the @pugi/cli release.
# Do not edit by hand: the next release overwrites this file.
class Pugi < Formula
  desc "Pugi CLI: an AI product team in your terminal"
  homepage "https://pugi.io"
  version "1.0.0-alpha.266"
  license "MIT"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@pugi/cli-darwin-arm64/-/cli-darwin-arm64-1.0.0-alpha.266.tgz"
      sha256 "a0aed5cad6cfde1d5778ab68882977c5918946ba329f78d774ca9965f534a50a"
    end
    on_intel do
      url "https://registry.npmjs.org/@pugi/cli-darwin-x64/-/cli-darwin-x64-1.0.0-alpha.266.tgz"
      sha256 "988083237844e3c8887fffbc2d1594fd65fe4f0ba57ecb65058039d3a7f3bc5f"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@pugi/cli-linux-arm64/-/cli-linux-arm64-1.0.0-alpha.266.tgz"
      sha256 "40fe6d05e5732516ae423a06c24be12554741e5225134d223957557b30734eb7"
    end
    on_intel do
      url "https://registry.npmjs.org/@pugi/cli-linux-x64/-/cli-linux-x64-1.0.0-alpha.266.tgz"
      sha256 "b7adf36df1aac333ebde256fc2e306fbddc8eb761b6254633eb39c21e394e2e3"
    end
  end

  # The persona skill pack ships in the npm wrapper package, not in the binary.
  resource "skills" do
    url "https://registry.npmjs.org/@pugi/cli/-/cli-1.0.0-alpha.266.tgz"
    sha256 "e2307f69c63eb1114afe8cf142b447eaf87643020b4cf95c3e314e89a7951e36"
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
