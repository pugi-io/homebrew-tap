# Written by the @pugi/cli release (pugi-core packages/opencode/script/pugi-homebrew.ts).
# Do not edit by hand: the next release overwrites this file.
class Pugi < Formula
  desc "Pugi CLI: an AI product team in your terminal"
  homepage "https://pugi.io"
  version "1.0.0-alpha.257"
  license "MIT"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@pugi/cli-darwin-arm64/-/cli-darwin-arm64-1.0.0-alpha.257.tgz"
      sha256 "22f3245149402853cc7515b93ab22331cd9191edbd0f8d324db6f9ac006ac4a0"
    end
    on_intel do
      url "https://registry.npmjs.org/@pugi/cli-darwin-x64/-/cli-darwin-x64-1.0.0-alpha.257.tgz"
      sha256 "c3c9ccde24b6da61ed8a401ee4668127448c570beb97070fa7232241805580b0"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@pugi/cli-linux-arm64/-/cli-linux-arm64-1.0.0-alpha.257.tgz"
      sha256 "84d2bd45e40f1d7e621f9152e41fc9c49b8448042447b06e3b1174799e392cd7"
    end
    on_intel do
      url "https://registry.npmjs.org/@pugi/cli-linux-x64/-/cli-linux-x64-1.0.0-alpha.257.tgz"
      sha256 "3e7c713a5f295aee9790a2740dd2f54d12f291477b126f8470be755ce6a52caa"
    end
  end

  # The persona skill pack ships in the npm wrapper package, not in the binary.
  resource "skills" do
    url "https://registry.npmjs.org/@pugi/cli/-/cli-1.0.0-alpha.257.tgz"
    sha256 "43c4d1390739c3c4b00e118b99f694c12bb55c674a1e4b8c32b3681b4b63adce"
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
