# Written by the @pugi/cli release (pugi-core packages/opencode/script/pugi-homebrew.ts).
# Do not edit by hand: the next release overwrites this file.
class Pugi < Formula
  desc "Pugi CLI: an AI product team in your terminal"
  homepage "https://pugi.io"
  version "1.0.0-alpha.254"
  license "MIT"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@pugi/cli-darwin-arm64/-/cli-darwin-arm64-1.0.0-alpha.254.tgz"
      sha256 "799d479a162713276f805ffdf3df77e1dd8592edcde8c07532f4e2e864deb85d"
    end
    on_intel do
      url "https://registry.npmjs.org/@pugi/cli-darwin-x64/-/cli-darwin-x64-1.0.0-alpha.254.tgz"
      sha256 "cdb8e547893d8ed54c876abe99281ebcbf40f9a118c3af48a1f7b4610e968f82"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@pugi/cli-linux-arm64/-/cli-linux-arm64-1.0.0-alpha.254.tgz"
      sha256 "19b1e7782a53ec1adb36824f0fe92da9ed6cfe8e111bc78731d289a0d46f51da"
    end
    on_intel do
      url "https://registry.npmjs.org/@pugi/cli-linux-x64/-/cli-linux-x64-1.0.0-alpha.254.tgz"
      sha256 "a42f84f8cd0dacff1fca4bfa8646c8c91e17f90941ed8d71fc10b5deee53febf"
    end
  end

  # The persona skill pack ships in the npm wrapper package, not in the binary.
  resource "skills" do
    url "https://registry.npmjs.org/@pugi/cli/-/cli-1.0.0-alpha.254.tgz"
    sha256 "7c37a6733680dd4a47f8aad074e2a34610c3936365bed609792bcabf10ffe810"
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
