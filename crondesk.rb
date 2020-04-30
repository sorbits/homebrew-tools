class Crondesk < Formula
  desc "Display command output on your desktop"
  homepage "https://github.com/sorbits/crondesk"
  url "https://github.com/sorbits/crondesk/archive/v1.0.1.tar.gz"
  sha256 "776213bbb7668e84bc85522d5480a0246026c158ce45dcd144e89e3edb2093d5"
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
