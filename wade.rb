# frozen_string_literal: true

class Wade < Formula
  desc "All-in-one Node.js version & npm/yarn/pnpm registry manager"
  homepage "https://github.com/wadefengx/wade"
  version "0.5.1"
  license "MIT"

  BASE_URL = "https://github.com/wadefengx/wade/releases/download/v0.5.1/"

  on_macos do
    if Hardware::CPU.arm?
      url "#{BASE_URL}wade-darwin-arm64.tar.gz"
      sha256 "6467815492fc19f17586f9d4224b47cca9c2298725aec0ad2185e357af2236ee"
    else
      url "#{BASE_URL}wade-darwin-amd64.tar.gz"
      sha256 "1286fa739be79ac4a6d170b8da8dbfcca036f6412abef3bf27ecd1311d34c3c1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "#{BASE_URL}wade-linux-arm64.tar.gz"
      # TODO: fill from release
    else
      url "#{BASE_URL}wade-linux-amd64.tar.gz"
      sha256 "1e62255b0eb9c1ce10bfb4cc38e617913afde30b570a2b317d261aad0d671974"
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
