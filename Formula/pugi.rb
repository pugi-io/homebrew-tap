# Written by the @pugi/cli release.
# Do not edit by hand: the next release overwrites this file.
class Pugi < Formula
  desc "Pugi CLI: an AI product team in your terminal"
  homepage "https://pugi.io"
  version "1.0.0-alpha.265"
  license "MIT"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@pugi/cli-darwin-arm64/-/cli-darwin-arm64-1.0.0-alpha.265.tgz"
      sha256 "c3851c75d453b8223c39daee4500e047db241f47b52d51faf73e243ccd7d130f"
    end
    on_intel do
      url "https://registry.npmjs.org/@pugi/cli-darwin-x64/-/cli-darwin-x64-1.0.0-alpha.265.tgz"
      sha256 "f333b0b5c444a6f18ecda925e7cb113ee9823fca6030a7f00b7f4d8a155cc642"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@pugi/cli-linux-arm64/-/cli-linux-arm64-1.0.0-alpha.265.tgz"
      sha256 "a4c7f4e1cc4d43123fc1351d1097778bb8a2623371af19d374ec4e69a076548d"
    end
    on_intel do
      url "https://registry.npmjs.org/@pugi/cli-linux-x64/-/cli-linux-x64-1.0.0-alpha.265.tgz"
      sha256 "422a78902a0dbe5edf71cabec0b27f1ee88f969d56fd1fe13378fe796b6d39f7"
    end
  end

  # The persona skill pack ships in the npm wrapper package, not in the binary.
  resource "skills" do
    url "https://registry.npmjs.org/@pugi/cli/-/cli-1.0.0-alpha.265.tgz"
    sha256 "088fe6ffc24f925496f5d49144b6fa47a2ff0dfe02576c4b362afd3fea7f8b79"
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
