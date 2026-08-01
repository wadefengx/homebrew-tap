# frozen_string_literal: true

class Wade < Formula
  desc "All-in-one Node.js version & npm/yarn/pnpm registry manager"
  homepage "https://github.com/wadefengx/wade"
  version "0.5.2"
  license "MIT"

  BASE_URL = "https://github.com/wadefengx/wade/releases/download/v0.5.2/"

  on_macos do
    if Hardware::CPU.arm?
      url "#{BASE_URL}wade-darwin-arm64.tar.gz"
      sha256 "36f3f18453d3a73d1cc34911a973db11e1c1f5727370152e0cc91e7ec5434659"
    else
      url "#{BASE_URL}wade-darwin-amd64.tar.gz"
      sha256 "4f63c8faae8dd9005d7f9c56fc298692b656e4ae4d5c04a5e11a814d70ef2d67"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "#{BASE_URL}wade-linux-arm64.tar.gz"
      # TODO: fill from release
    else
      url "#{BASE_URL}wade-linux-amd64.tar.gz"
      sha256 "6a6693769986be9ae23282c9ea47b97da7cf53d363ea8ef61bb6cd41a931120f"
    end
  end

  def install
    bin.install "wade"
  end

  def post_install
    system "#{bin}/wade", "setup"
    ohai "Run 'echo \"export PATH=\\\"$HOME/.wade/shims:$PATH\\\"\" >> ~/.zshrc' to enable Node shims"
  end

  test do
    assert_match "wade", shell_output("#{bin}/wade --help")
  end
end
