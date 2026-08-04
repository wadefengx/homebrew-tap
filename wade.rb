# frozen_string_literal: true

class Wade < Formula
  desc "All-in-one Node.js version & npm/yarn/pnpm registry manager"
  homepage "https://github.com/wadefengx/wade"
  version "0.5.6"
  license "MIT"

  BASE_URL = "https://github.com/wadefengx/wade/releases/download/v0.5.6/"

  on_macos do
    if Hardware::CPU.arm?
      url "#{BASE_URL}wade-darwin-arm64.tar.gz"
      sha256 "af68dcecf01f65a0c9be8778fc2d543db6f3082ef7085bc6750c0ab09c7bbba6"
    else
      url "#{BASE_URL}wade-darwin-amd64.tar.gz"
      sha256 "2d995adb71ff7a81f88a88c3798c385665a2b488ac6f598cb8efae29a43f13c5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "#{BASE_URL}wade-linux-arm64.tar.gz"
      # TODO: fill from release
    else
      url "#{BASE_URL}wade-linux-amd64.tar.gz"
      sha256 "f2051539a51c0bbb02e128d282aa583dd1442dff4d7463dd2a4ba35c1e177d8a"
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
