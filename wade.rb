# frozen_string_literal: true

class Wade < Formula
  desc "All-in-one Node.js version & npm/yarn/pnpm registry manager"
  homepage "https://github.com/wadefengx/wade"
  version "0.4.3"
  license "MIT"

  BASE_URL = "https://github.com/wadefengx/wade/releases/download/v0.4.3/"

  on_macos do
    if Hardware::CPU.arm?
      url "#{BASE_URL}wade-darwin-arm64.tar.gz"
      sha256 "e4ad72c218d8d8f3a6c1dbd54ee511ac26898e0384b438f07a5c58df4ef95cbf"
    else
      url "#{BASE_URL}wade-darwin-amd64.tar.gz"
      sha256 "0f08501148f4185749f1070f85ac9fe26bc8309c08630c36fa412344118ee711"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "#{BASE_URL}wade-linux-arm64.tar.gz"
      # TODO: fill from release
    else
      url "#{BASE_URL}wade-linux-amd64.tar.gz"
      sha256 "03af05c6cec2327c5fcf35215ba172e976c398b66041e349ca4fc91d6d3753d4"
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
