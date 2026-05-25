class Pugi < Formula
  desc "Pugi CLI - terminal-native AI software execution"
  homepage "https://pugi.io"
  url "https://registry.npmjs.org/@pugi/cli/-/cli-0.1.0-alpha.9.tgz"
  sha256 "50eacee3e6b66105597d58dc1b8d8776f2450b26106f8e5f0c12e211285441b9"
  license "MIT"
  version "0.1.0-alpha.9"

  depends_on "node"

  def install
    system "npm", "install", "-g",
           "--prefix=#{libexec}",
           "--no-audit",
           "--no-fund",
           cached_download
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "pugi", shell_output("#{bin}/pugi --version")
  end
end