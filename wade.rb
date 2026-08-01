# frozen_string_literal: true

class Wade < Formula
  desc "All-in-one Node.js version & npm/yarn/pnpm registry manager"
  homepage "https://github.com/wadefengx/wade"
  version "0.4.5"
  license "MIT"

  BASE_URL = "https://github.com/wadefengx/wade/releases/download/v0.4.5/"

  on_macos do
    if Hardware::CPU.arm?
      url "#{BASE_URL}wade-darwin-arm64.tar.gz"
      sha256 "7e115ad7c8db667808e5a897ff9b8fbb1bd83c6500eb1c2a133ad2fedb9f44f4"
    else
      url "#{BASE_URL}wade-darwin-amd64.tar.gz"
      sha256 "7260e1525ad7ebce388d0e060f95a986d260025ac659b1ef99040f42bdfc4675"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "#{BASE_URL}wade-linux-arm64.tar.gz"
      # TODO: fill from release
    else
      url "#{BASE_URL}wade-linux-amd64.tar.gz"
      sha256 "6c8aa5185ab07ec6896e0dc897a92bc86e72217c8603463075e896fdd990debe"
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
