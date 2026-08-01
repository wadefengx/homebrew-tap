# frozen_string_literal: true

class Wade < Formula
  desc "All-in-one Node.js version & npm/yarn/pnpm registry manager"
  homepage "https://github.com/wadefengx/wade"
  version "0.4.1"
  license "MIT"

  BASE_URL = "https://github.com/wadefengx/wade/releases/download/v0.4.1/"

  on_macos do
    if Hardware::CPU.arm?
      url "#{BASE_URL}wade-darwin-arm64.tar.gz"
      sha256 "2800877d69525a32f4d77d1953ebe85b8726218bfc92d6f06596f63abd09d4b7"
    else
      url "#{BASE_URL}wade-darwin-amd64.tar.gz"
      sha256 "6df69e601574e34a822fa3b2fb9df67411e07035cc4c9ba56f5381f3a8725b37"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "#{BASE_URL}wade-linux-arm64.tar.gz"
      # TODO: fill from release
    else
      url "#{BASE_URL}wade-linux-amd64.tar.gz"
      sha256 "ca1d1ca4885c4d8d722b1227c38bd3c248610bece3473498a7c0d2f34dab8f05"
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
