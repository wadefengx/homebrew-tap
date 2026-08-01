# frozen_string_literal: true

class Wade < Formula
  desc "All-in-one Node.js version & npm/yarn/pnpm registry manager"
  homepage "https://github.com/wadefengx/wade"
  version "0.5.0"
  license "MIT"

  BASE_URL = "https://github.com/wadefengx/wade/releases/download/v0.5.0/"

  on_macos do
    if Hardware::CPU.arm?
      url "#{BASE_URL}wade-darwin-arm64.tar.gz"
      sha256 "7641f4432a353a0ffff4a5c7948bc09da71c4f55ef7d1cc6e29c4b7443f82021"
    else
      url "#{BASE_URL}wade-darwin-amd64.tar.gz"
      sha256 "08710d05c32240f2872670e257cec940a4eede95f1c8b725f6e8651d55388cd3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "#{BASE_URL}wade-linux-arm64.tar.gz"
      # TODO: fill from release
    else
      url "#{BASE_URL}wade-linux-amd64.tar.gz"
      sha256 "8acaa322be0165fa913a1fa4d19589a53a1f830879522c5cee0a656ddad251fb"
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
