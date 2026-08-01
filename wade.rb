# frozen_string_literal: true

class Wade < Formula
  desc "All-in-one Node.js version & npm/yarn/pnpm registry manager"
  homepage "https://github.com/wadefengx/wade"
  version "0.3.2"
  license "MIT"

  BASE_URL = "https://github.com/wadefengx/wade/releases/download/v0.3.2/"

  on_macos do
    if Hardware::CPU.arm?
      url "#{BASE_URL}wade-darwin-arm64.tar.gz"
      sha256 "5e92c00df9314503268d2439a4b150e58fe3ec520ade0ebb366f931a3d406948"
    else
      url "#{BASE_URL}wade-darwin-amd64.tar.gz"
      sha256 "2e712624938b2f2310cc1e0c0b834d9a9c1cd48eb90aa02fad050b74db3cd551"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "#{BASE_URL}wade-linux-arm64.tar.gz"
      # TODO: fill from release
    else
      url "#{BASE_URL}wade-linux-amd64.tar.gz"
      sha256 "c5e4a08f9f79d149d14146a242a3aed16e6bd9c94d0bd8dac19f7ff09bd34a1c"
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
