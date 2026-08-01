# frozen_string_literal: true

class Wade < Formula
  desc "All-in-one Node.js version & npm/yarn/pnpm registry manager"
  homepage "https://github.com/wadefengx/wade"
  version "0.5.3"
  license "MIT"

  BASE_URL = "https://github.com/wadefengx/wade/releases/download/v0.5.3/"

  on_macos do
    if Hardware::CPU.arm?
      url "#{BASE_URL}wade-darwin-arm64.tar.gz"
      sha256 "5539bca1bbbb72a8c30788b2f3fcab62f8b74b58b232df4ebb44b6907c620777"
    else
      url "#{BASE_URL}wade-darwin-amd64.tar.gz"
      sha256 "58f47c69e50649613f5795e51d80bc4fea905ebfac4b4a8cd7cc4b15b1ebc06c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "#{BASE_URL}wade-linux-arm64.tar.gz"
      # TODO: fill from release
    else
      url "#{BASE_URL}wade-linux-amd64.tar.gz"
      sha256 "7e1197687d19d211f4bcc7e27f4475672133f0aa84ffee21088743be5049fb62"
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
