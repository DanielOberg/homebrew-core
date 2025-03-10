class ColorCode < Formula
  desc "Free advanced MasterMind clone"
  homepage "http://colorcode.laebisch.com/"
  url "http://colorcode.laebisch.com/download/ColorCode-0.8.5.tar.gz"
  sha256 "7c128db12af6ab11439eb710091b4a448100553a4d11d3a7c8dafdfbc57c1a85"
  license "GPL-3.0-or-later"
  revision 2

  livecheck do
    url "http://colorcode.laebisch.com/download"
    regex(/href=.*?ColorCode[._-]v?(\d+(?:\.\d+)+)\.t/i)
  end

  bottle do
    sha256 cellar: :any, arm64_big_sur: "8e7c81eca9f900ce20df5013b24120a39732113506ca72db063c52dec64fb028"
    sha256 cellar: :any, big_sur:       "9aac69e2526ff08545f2f601fb6847ea1b131fa30fee2f56f2003bafdd163cc0"
    sha256 cellar: :any, catalina:      "29407731a7c5e10b3812346227ef3ba75ce4b16bf48e603036442140691e0f8e"
    sha256 cellar: :any, mojave:        "f8f2e6a8f4aac3307568cccaa8eb202c3be01d653396e1cd8bb9ccf76d24f6db"
  end

  depends_on "qt@5"

  def install
    qt5 = Formula["qt@5"].opt_prefix
    system "#{qt5}/bin/qmake"
    system "make"
    prefix.install "ColorCode.app"
    bin.write_exec_script "#{prefix}/ColorCode.app/Contents/MacOS/colorcode"
  end

  test do
    system "#{bin}/colorcode", "-h"
  end
end
