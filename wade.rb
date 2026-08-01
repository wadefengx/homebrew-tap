# frozen_string_literal: true

class Wade < Formula
  desc "All-in-one Node.js version & npm/yarn/pnpm registry manager"
  homepage "https://github.com/wadefengx/wade"
  version "0.4.2"
  license "MIT"

  BASE_URL = "https://github.com/wadefengx/wade/releases/download/v0.4.2/"

  on_macos do
    if Hardware::CPU.arm?
      url "#{BASE_URL}wade-darwin-arm64.tar.gz"
      sha256 "3a5d67404bb6c5f12a663cd71a3616005e266e0055d3f61b85ee66268a5cda85"
    else
      url "#{BASE_URL}wade-darwin-amd64.tar.gz"
      sha256 "4e9955fdd65a5273e4f0d8795714e528a854167b3bad696ce718ec9380c1dce1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "#{BASE_URL}wade-linux-arm64.tar.gz"
      # TODO: fill from release
    else
      url "#{BASE_URL}wade-linux-amd64.tar.gz"
      sha256 "001c8ed6032e705636bfefd18c451fb5ac9983b3d70c65d6b00472690fa68511"
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
