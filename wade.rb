# frozen_string_literal: true

class Wade < Formula
  desc "All-in-one Node.js version & npm/yarn/pnpm registry manager"
  homepage "https://github.com/wadefengx/wade"
  version "0.3.3"
  license "MIT"

  BASE_URL = "https://github.com/wadefengx/wade/releases/download/v0.3.3/"

  on_macos do
    if Hardware::CPU.arm?
      url "#{BASE_URL}wade-darwin-arm64.tar.gz"
      sha256 "704fcd6dc6bcbff1df2befd00ffa6b93826846b855b59181e28dea2c72e7ee04"
    else
      url "#{BASE_URL}wade-darwin-amd64.tar.gz"
      sha256 "75281f9285246c2cf862d630a4143cc5ee744135595e51922c9d36da2365a063"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "#{BASE_URL}wade-linux-arm64.tar.gz"
      # TODO: fill from release
    else
      url "#{BASE_URL}wade-linux-amd64.tar.gz"
      sha256 "1805cd980d84d20890dca4a60e6fcefd49c5a895399b4c6e71c73ef85f33b957"
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
