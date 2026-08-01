# frozen_string_literal: true

class Wade < Formula
  desc "All-in-one Node.js version & npm/yarn/pnpm registry manager"
  homepage "https://github.com/wadefengx/wade"
  version "0.3.5"
  license "MIT"

  BASE_URL = "https://github.com/wadefengx/wade/releases/download/v0.3.5/"

  on_macos do
    if Hardware::CPU.arm?
      url "#{BASE_URL}wade-darwin-arm64.tar.gz"
      sha256 "6d58e9335e32fb1b25894190bb540d9995b751446593cd8d54ce0b1bbbca0a21"
    else
      url "#{BASE_URL}wade-darwin-amd64.tar.gz"
      sha256 "e1e8f4c27f8b02e0dcf70912c485052c3ae067397d7c019c31a6bb21e7628055"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "#{BASE_URL}wade-linux-arm64.tar.gz"
      # TODO: fill from release
    else
      url "#{BASE_URL}wade-linux-amd64.tar.gz"
      sha256 "f6ed49aa7aa6a7f5cad7f1cbcf621dd0651ef29ba1d37d045a4ec6aafee2a194"
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
