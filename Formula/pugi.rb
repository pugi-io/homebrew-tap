class Pugi < Formula
  desc "Pugi CLI - terminal-native AI software execution"
  homepage "https://pugi.io"
  url "https://registry.npmjs.org/@pugi/cli/-/cli-0.1.0-alpha.3.tgz"
  sha256 "beb18c724bf7e97033e650fcca61d5b8dfa1c8cbd3e3681cc7b8e4f2a969deaa"
  license "MIT"
  version "0.1.0-alpha.3"

  # Pin to node@22 — @pugi/cli 0.1.0-alpha.3 uses globSync from node:fs which
  # was added in Node 22. The package.json `engines` field says >=20 but the
  # runtime requires 22+. Bump tracked in pugi-io/pugi.
  depends_on "node@22"

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
