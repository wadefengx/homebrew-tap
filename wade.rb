# frozen_string_literal: true

class Wade < Formula
  desc "All-in-one Node.js version & npm/yarn/pnpm registry manager"
  homepage "https://github.com/wadefengx/wade"
  version "0.4.0"
  license "MIT"

  BASE_URL = "https://github.com/wadefengx/wade/releases/download/v0.4.0/"

  on_macos do
    if Hardware::CPU.arm?
      url "#{BASE_URL}wade-darwin-arm64.tar.gz"
      sha256 "04ab56f1dd0f92b326653221e3fd491a9d99c9d790de17b33b4878c0ebd108b3"
    else
      url "#{BASE_URL}wade-darwin-amd64.tar.gz"
      sha256 "5952d5562b888999a2f379c3382943d137efd21d9f0f358ffe24e191d605f9f0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "#{BASE_URL}wade-linux-arm64.tar.gz"
      # TODO: fill from release
    else
      url "#{BASE_URL}wade-linux-amd64.tar.gz"
      sha256 "d5dad5ec7cd325e7228fc145ca06cb3e6aabdcaf91eac2b764d5c52978b3afa7"
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
