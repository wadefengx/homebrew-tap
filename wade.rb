# frozen_string_literal: true

class Wade < Formula
  desc "All-in-one Node.js version & npm/yarn/pnpm registry manager"
  homepage "https://github.com/wadefengx/wade"
  version "0.3.1"
  license "MIT"

  BASE_URL = "https://github.com/wadefengx/wade/releases/download/v0.3.1/"

  on_macos do
    if Hardware::CPU.arm?
      url "#{BASE_URL}wade-darwin-arm64.tar.gz"
      sha256 "883164aba73bd2107b1d464b1071d4c801bc303f58a072621c1f8b8f34ff3687"
    else
      url "#{BASE_URL}wade-darwin-amd64.tar.gz"
      sha256 "92370e15f92ac55ee178568c63e66ea7752d698f2d8774b36c5598fb727a5515"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "#{BASE_URL}wade-linux-arm64.tar.gz"
      # TODO: fill from release
    else
      url "#{BASE_URL}wade-linux-amd64.tar.gz"
      sha256 "77e9e58bc3fdd04d54852ba6a62c4b07b428358e46040f4047d44e2bf8134543"
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
