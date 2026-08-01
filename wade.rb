# frozen_string_literal: true

class Wade < Formula
  desc "All-in-one Node.js version & npm/yarn/pnpm registry manager"
  homepage "https://github.com/wadefengx/wade"
  version "0.3.9"
  license "MIT"

  BASE_URL = "https://github.com/wadefengx/wade/releases/download/v0.3.9/"

  on_macos do
    if Hardware::CPU.arm?
      url "#{BASE_URL}wade-darwin-arm64.tar.gz"
      sha256 "b43d7c1a42ff94e54141cd4a4bca68e705f5e0b8a9d6938feeddf4db09d3be00"
    else
      url "#{BASE_URL}wade-darwin-amd64.tar.gz"
      sha256 "8cb1758f8041929f5db8a00b876a1137eb3f99745070165d158f0b16a99e9f31"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "#{BASE_URL}wade-linux-arm64.tar.gz"
      # TODO: fill from release
    else
      url "#{BASE_URL}wade-linux-amd64.tar.gz"
      sha256 "772e027069fd8f0c6ed2189e6ea1adf24acee0dbfa411d5cd7510074576497d8"
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
