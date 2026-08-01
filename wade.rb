# frozen_string_literal: true

class Wade < Formula
  desc "All-in-one Node.js version & npm/yarn/pnpm registry manager"
  homepage "https://github.com/wadefengx/wade"
  version "0.4.4"
  license "MIT"

  BASE_URL = "https://github.com/wadefengx/wade/releases/download/v0.4.4/"

  on_macos do
    if Hardware::CPU.arm?
      url "#{BASE_URL}wade-darwin-arm64.tar.gz"
      sha256 "d68744e7ae2b995f3a0009478021bf3f47464f63c4992d948f6d3ea1ea751c88"
    else
      url "#{BASE_URL}wade-darwin-amd64.tar.gz"
      sha256 "8e5238fdb50a7bfcdf2a8c1324c23064331a471adc49bd0b8a40db7b010130eb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "#{BASE_URL}wade-linux-arm64.tar.gz"
      # TODO: fill from release
    else
      url "#{BASE_URL}wade-linux-amd64.tar.gz"
      sha256 "884adfe15f7101c4057f54167911eb35b674abf6b7ee220dddeab3f067ab8fee"
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
