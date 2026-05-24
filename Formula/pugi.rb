class Pugi < Formula
  desc "Pugi CLI - terminal-native AI software execution"
  homepage "https://pugi.io"
  url "https://registry.npmjs.org/@pugi/cli/-/cli-0.1.0-alpha.7.tgz"
  sha256 "3caab34a83bb9182042b31f3d7a72626691d92e905cc1c2837af48b9825e5766"
  license "MIT"
  version "0.1.0-alpha.7"

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