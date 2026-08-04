# frozen_string_literal: true

class Wade < Formula
  desc "All-in-one Node.js version & npm/yarn/pnpm registry manager"
  homepage "https://github.com/wadefengx/wade"
  version "0.5.5"
  license "MIT"

  BASE_URL = "https://github.com/wadefengx/wade/releases/download/v0.5.5/"

  on_macos do
    if Hardware::CPU.arm?
      url "#{BASE_URL}wade-darwin-arm64.tar.gz"
      sha256 "b861a97f26775ecfaabbdb85f0a9b40ae9ad2a6914bdd548dd3cb381209bcb92"
    else
      url "#{BASE_URL}wade-darwin-amd64.tar.gz"
      sha256 "30a268873768e17f73000cea34821f69933280868b959202b579cd5ad05e1099"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "#{BASE_URL}wade-linux-arm64.tar.gz"
      # TODO: fill from release
    else
      url "#{BASE_URL}wade-linux-amd64.tar.gz"
      sha256 "9b554e3604bcfc778176cc0c1f89aa1b94c6975d6f3e0ed9a8684512d8d26f95"
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
