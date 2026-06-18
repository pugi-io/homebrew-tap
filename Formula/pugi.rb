class Pugi < Formula
  desc "Pugi CLI - terminal-native AI software execution"
  homepage "https://pugi.io"
  url "https://registry.npmjs.org/@pugi/cli/-/cli-1.0.0-alpha.70.tgz"
  sha256 "75368ab95e5ba1a1a2a5ce24d1411d43455ec2372fa313b60f771cd3440a2cc8"
  license "MIT"
  version "1.0.0-alpha.70"

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