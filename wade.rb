# frozen_string_literal: true

class Wade < Formula
  desc "All-in-one Node.js version & npm/yarn/pnpm registry manager"
  homepage "https://github.com/wadefengx/wade"
  version "0.3.8"
  license "MIT"

  BASE_URL = "https://github.com/wadefengx/wade/releases/download/v0.3.8/"

  on_macos do
    if Hardware::CPU.arm?
      url "#{BASE_URL}wade-darwin-arm64.tar.gz"
      sha256 "3345607fa13250c3f79c7c424ba1fad04541d4c2161ab0db8b1be8a861d3842e"
    else
      url "#{BASE_URL}wade-darwin-amd64.tar.gz"
      sha256 "a09f11a6a4673a9b6df4b598ffe34de001c2386d3dc3292462be51d94dafd299"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "#{BASE_URL}wade-linux-arm64.tar.gz"
      # TODO: fill from release
    else
      url "#{BASE_URL}wade-linux-amd64.tar.gz"
      sha256 "6afc7c39568a051a25240d15a385e9414af192bd77a409d582a11fa8f22f1044"
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
