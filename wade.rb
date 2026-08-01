# frozen_string_literal: true

class Wade < Formula
  desc "All-in-one Node.js version & npm/yarn/pnpm registry manager"
  homepage "https://github.com/wadefengx/wade"
  version "0.4.9"
  license "MIT"

  BASE_URL = "https://github.com/wadefengx/wade/releases/download/v0.4.9/"

  on_macos do
    if Hardware::CPU.arm?
      url "#{BASE_URL}wade-darwin-arm64.tar.gz"
      sha256 "33e1a8c5845af7e0e06a9765ecb0c4aa15cbd9f921994d836dad2b4547e0df88"
    else
      url "#{BASE_URL}wade-darwin-amd64.tar.gz"
      sha256 "591ecb091dce592210554959f9cc47e299916bd312903516cdf655f12be6bb62"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "#{BASE_URL}wade-linux-arm64.tar.gz"
      # TODO: fill from release
    else
      url "#{BASE_URL}wade-linux-amd64.tar.gz"
      sha256 "ceb5b8724d77a3dfb41fabd96a72ea9957473d556b16693c9f609b1bdada5bf7"
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
