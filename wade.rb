# frozen_string_literal: true

class Wade < Formula
  desc "All-in-one Node.js version & npm/yarn/pnpm registry manager"
  homepage "https://github.com/wadefengx/wade"
  version "0.4.7"
  license "MIT"

  BASE_URL = "https://github.com/wadefengx/wade/releases/download/v0.4.7/"

  on_macos do
    if Hardware::CPU.arm?
      url "#{BASE_URL}wade-darwin-arm64.tar.gz"
      sha256 "40f0c0f9b3a2db192a5842a0db9b8381ad6f774820dd80750e5012aedeb4afd9"
    else
      url "#{BASE_URL}wade-darwin-amd64.tar.gz"
      sha256 "fbcb6a1fe8467926d67da18625f2a506f04f6709cc4a67721e435c66f7441389"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "#{BASE_URL}wade-linux-arm64.tar.gz"
      # TODO: fill from release
    else
      url "#{BASE_URL}wade-linux-amd64.tar.gz"
      sha256 "b65db35230cdd8b99cc785d3734c3a38017106a950d6539495516a99a36df1c8"
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
