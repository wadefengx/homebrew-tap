# frozen_string_literal: true

class Wade < Formula
  desc "All-in-one Node.js version & npm/yarn/pnpm registry manager"
  homepage "https://github.com/wadefengx/wade"
  version "0.3.4"
  license "MIT"

  BASE_URL = "https://github.com/wadefengx/wade/releases/download/v0.3.4/"

  on_macos do
    if Hardware::CPU.arm?
      url "#{BASE_URL}wade-darwin-arm64.tar.gz"
      sha256 "123cc02283d5cc0d8fecf81c4397faeeb63e80a894e29ba73fd286b60bcc6843"
    else
      url "#{BASE_URL}wade-darwin-amd64.tar.gz"
      sha256 "f1b0c95e0839abf6f6b944ba4452b6ddfb9752c12a8e2b3d2e5bd67bc7ab7efd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "#{BASE_URL}wade-linux-arm64.tar.gz"
      # TODO: fill from release
    else
      url "#{BASE_URL}wade-linux-amd64.tar.gz"
      sha256 "510d8b8887fc4fc15040d2eb0d047f139a9ce5d423319d6b38b7bc44daa39f4e"
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
