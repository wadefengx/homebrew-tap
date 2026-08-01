# frozen_string_literal: true

class Wade < Formula
  desc "All-in-one Node.js version & npm/yarn/pnpm registry manager"
  homepage "https://github.com/wadefengx/wade"
  version "0.3.6"
  license "MIT"

  BASE_URL = "https://github.com/wadefengx/wade/releases/download/v0.3.6/"

  on_macos do
    if Hardware::CPU.arm?
      url "#{BASE_URL}wade-darwin-arm64.tar.gz"
      sha256 "c9548e0d20f6b73c48ce99610bb2c7ef3095c976ab42b7af543b4b43905cbd28"
    else
      url "#{BASE_URL}wade-darwin-amd64.tar.gz"
      sha256 "5cefdd7a8ddfc38ff222419d9716ad380b659778e67b15c88f679f3a341e5922"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "#{BASE_URL}wade-linux-arm64.tar.gz"
      # TODO: fill from release
    else
      url "#{BASE_URL}wade-linux-amd64.tar.gz"
      sha256 "69a2286a149f72535bd10fd4f9257f10a1aa04fac6aa425aa3945dfe3596a094"
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
