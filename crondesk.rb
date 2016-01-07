class Crondesk < Formula
  desc "Display command output on your desktop"
  homepage "https://github.com/sorbits/crondesk"
  url "https://github.com/sorbits/crondesk/archive/v1.0.tar.gz"
  sha256 "70780981c0d7974f15b855addab43bb00ff5dd4268ac9c67b7c21cde6f6413f6"
  head "https://github.com/sorbits/crondesk.git"

  def install
    system "make"
    bin.install "crondesk"
  end

  def post_install
    unless File.exists?(File.expand_path('~/Library/LaunchAgents/com.macromates.crondesk.plist'))
      system "#{HOMEBREW_PREFIX}/bin/crondesk", "install"
    end
  end

  test do
    system bin/"crondesk", "help"
  end
end
