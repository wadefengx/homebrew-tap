# frozen_string_literal: true

class Wade < Formula
  desc "All-in-one Node.js version & npm/yarn/pnpm registry manager"
  homepage "https://github.com/wadefengx/wade"
  version "0.3.0"
  license "MIT"

  BASE_URL = "https://github.com/wadefengx/wade/releases/download/v0.3.0/"

  on_macos do
    if Hardware::CPU.arm?
      url "#{BASE_URL}wade-darwin-arm64.tar.gz"
      sha256 "144cf92d719fdecbdd8634a0e42d023ded7208011231bc816f25d1d084ef9f83"
    else
      url "#{BASE_URL}wade-darwin-amd64.tar.gz"
      sha256 "a313083e6c00d086d056dc9c36af3efc34dcae510c4c3d20a5102e1c2dd096be"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "#{BASE_URL}wade-linux-arm64.tar.gz"
      # TODO: fill from release
    else
      url "#{BASE_URL}wade-linux-amd64.tar.gz"
      sha256 "6edf7954917f1f1d28b6d5fed82912595a9c570a009bf35697628426ca6b6625"
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
