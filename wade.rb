# frozen_string_literal: true

class Wade < Formula
  desc "All-in-one Node.js version & npm/yarn/pnpm registry manager"
  homepage "https://github.com/wadefengx/wade"
  version "0.3.7"
  license "MIT"

  BASE_URL = "https://github.com/wadefengx/wade/releases/download/v0.3.7/"

  on_macos do
    if Hardware::CPU.arm?
      url "#{BASE_URL}wade-darwin-arm64.tar.gz"
      sha256 "54f33c69749e30fad9da1d1a8b5f7cf51026bf4eb43ad715556182a27f1ad569"
    else
      url "#{BASE_URL}wade-darwin-amd64.tar.gz"
      sha256 "0bf12026e6234fa79b2db649226b6a0e0a49fc572c557147e10158181ca0f9aa"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "#{BASE_URL}wade-linux-arm64.tar.gz"
      # TODO: fill from release
    else
      url "#{BASE_URL}wade-linux-amd64.tar.gz"
      sha256 "7f20730d03339ada96527323324fdedc761204c73cd91b5621b21687af0f8c28"
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
