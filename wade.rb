# frozen_string_literal: true

class Wade < Formula
  desc "All-in-one Node.js version & npm/yarn/pnpm registry manager"
  homepage "https://github.com/wadefengx/wade"
  version "0.2.1"
  license "MIT"

  BASE_URL = "https://github.com/wadefengx/wade/releases/download/v0.2.1/"

  on_macos do
    if Hardware::CPU.arm?
      url "#{BASE_URL}wade-darwin-arm64.tar.gz"
      sha256 "007c892574b096679fe1aa9cff96e3dbfbe0e6af0ff78576e70ea56e16854fe0"
    else
      url "#{BASE_URL}wade-darwin-amd64.tar.gz"
      sha256 "cd91a87982b393b12e24a12aebf6d79f93353d661f1d3c001020e475247e147a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "#{BASE_URL}wade-linux-arm64.tar.gz"
      # TODO: fill from release
    else
      url "#{BASE_URL}wade-linux-amd64.tar.gz"
      sha256 "7db21cede1e2efbdf00961974157bf077553886a3fd8e2812db3e7e637eb645d"
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
