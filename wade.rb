# frozen_string_literal: true

class Wade < Formula
  desc "All-in-one Node.js version & npm/yarn/pnpm registry manager"
  homepage "https://github.com/wadefengx/wade"
  version "0.4.6"
  license "MIT"

  BASE_URL = "https://github.com/wadefengx/wade/releases/download/v0.4.6/"

  on_macos do
    if Hardware::CPU.arm?
      url "#{BASE_URL}wade-darwin-arm64.tar.gz"
      sha256 "b8bc5bd67c6c4fbe356d0a9cf5c40f3c20eee6854fe31573179e69d939c7dfb8"
    else
      url "#{BASE_URL}wade-darwin-amd64.tar.gz"
      sha256 "8fe348fc003fa64e8abc0449c7c45502365d4a5a5871088290359e624e4e9961"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "#{BASE_URL}wade-linux-arm64.tar.gz"
      # TODO: fill from release
    else
      url "#{BASE_URL}wade-linux-amd64.tar.gz"
      sha256 "567d8804eb61623daccb5f6a9d8147dfd47819e5cb38bbd02c2f7383c358365d"
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
