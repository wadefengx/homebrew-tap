# frozen_string_literal: true

class Wade < Formula
  desc "All-in-one Node.js version & npm/yarn/pnpm registry manager"
  homepage "https://github.com/wadefengx/wade"
  version "0.5.4"
  license "MIT"

  BASE_URL = "https://github.com/wadefengx/wade/releases/download/v0.5.4/"

  on_macos do
    if Hardware::CPU.arm?
      url "#{BASE_URL}wade-darwin-arm64.tar.gz"
      sha256 "976a904de20017ea383aa18bf786792814f420324989294fcbfb5624a6631d48"
    else
      url "#{BASE_URL}wade-darwin-amd64.tar.gz"
      sha256 "5f91c042a728ef0047ae51e72101009689a20035c090d04228f89f73f78a668d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "#{BASE_URL}wade-linux-arm64.tar.gz"
      # TODO: fill from release
    else
      url "#{BASE_URL}wade-linux-amd64.tar.gz"
      sha256 "1a01cdfb568c62853ef4975fdf31a4f238571e4d927b824d428b197a7cfa6551"
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
