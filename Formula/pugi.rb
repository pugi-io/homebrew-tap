# Written by the @pugi/cli release.
# Do not edit by hand: the next release overwrites this file.
class Pugi < Formula
  desc "Pugi CLI: an AI product team in your terminal"
  homepage "https://pugi.io"
  version "1.0.0-alpha.267"
  license "MIT"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@pugi/cli-darwin-arm64/-/cli-darwin-arm64-1.0.0-alpha.267.tgz"
      sha256 "15003722af4f33a4dff8e87bb3f4b126332fadeaccea908380b9b1750050599f"
    end
    on_intel do
      url "https://registry.npmjs.org/@pugi/cli-darwin-x64/-/cli-darwin-x64-1.0.0-alpha.267.tgz"
      sha256 "2ebfdb6ce3a22e358e4797361a7e1083ad3f28f552b26741666df5d6241c2d92"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@pugi/cli-linux-arm64/-/cli-linux-arm64-1.0.0-alpha.267.tgz"
      sha256 "e1737f00e6b19560de6e7eb3bb6e646a19ea16a9e411794a3b0b5cd68e97dfd5"
    end
    on_intel do
      url "https://registry.npmjs.org/@pugi/cli-linux-x64/-/cli-linux-x64-1.0.0-alpha.267.tgz"
      sha256 "aaaaefae9983aa3b7f7bbd6224a48f675d14fda6e80edad505490e437984873c"
    end
  end

  # The persona skill pack ships in the npm wrapper package, not in the binary.
  resource "skills" do
    url "https://registry.npmjs.org/@pugi/cli/-/cli-1.0.0-alpha.267.tgz"
    sha256 "9be5f6d6459244cb7468c90e36c9b17c2e0d920b0d72b8403cca1b0f0e2f6044"
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
