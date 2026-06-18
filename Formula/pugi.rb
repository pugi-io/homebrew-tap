class Pugi < Formula
  desc "Pugi CLI - terminal-native AI software execution"
  homepage "https://pugi.io"
  url "https://registry.npmjs.org/@pugi/cli/-/cli-1.0.0-alpha.69.tgz"
  sha256 "6f107e11f87c0edb7b1b86283b23bb5ac4c255263f57e5a8196ad81976e0b0c3"
  license "MIT"
  version "1.0.0-alpha.69"

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