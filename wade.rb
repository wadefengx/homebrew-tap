# frozen_string_literal: true

class Wade < Formula
  desc "All-in-one Node.js version & npm/yarn/pnpm registry manager"
  homepage "https://github.com/wadefengx/wade"
  version "0.4.8"
  license "MIT"

  BASE_URL = "https://github.com/wadefengx/wade/releases/download/v0.4.8/"

  on_macos do
    if Hardware::CPU.arm?
      url "#{BASE_URL}wade-darwin-arm64.tar.gz"
      sha256 "b379ae037a31c786d18cdb87f77c083e6c32e6d50db9720380ac41bf39dc765d"
    else
      url "#{BASE_URL}wade-darwin-amd64.tar.gz"
      sha256 "9c4469ef288461a93dcd10202e8cec0903a091b864cf012ea796a6bcd4f29021"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "#{BASE_URL}wade-linux-arm64.tar.gz"
      # TODO: fill from release
    else
      url "#{BASE_URL}wade-linux-amd64.tar.gz"
      sha256 "84369c52e34ffef463616aebc3c4f5f4e8393d385c72f77e1567e7411d174cfc"
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
