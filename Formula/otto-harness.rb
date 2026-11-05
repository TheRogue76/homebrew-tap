class OttoHarness < Formula
  desc "Lets coding agents see and operate Linux desktop apps and Android devices"
  homepage "https://github.com/TheRogue76/otto-harness"
  version "2.0.0"
  license "MIT"

  on_intel do
    url "https://github.com/TheRogue76/otto-harness/releases/download/v#{version}/otto-harness-#{version}-linux-x86_64.tar.gz"
    sha256 "0e600d6fc3cffeac84b5d8a3207e6ca5e00553e2cde72980a78d35b108dbe4ba"
  end
  on_arm do
    url "https://github.com/TheRogue76/otto-harness/releases/download/v#{version}/otto-harness-#{version}-linux-aarch64.tar.gz"
    sha256 "aa5dd8628572243eac357e904522671b76766e590a81a5286a307f0f160edabe"
  end

  depends_on :linux

  def install
    prefix.install "bin", "libexec", "share"
    bin.install_symlink "otto" => "macos-harness"
  end

  def caveats
    <<~EOS
      Run `otto doctor`, then `otto permissions grant` for what your desktop asks, and
      connect your agent with `otto setup claude` (or codex, cursor, gemini, opencode or pi).
      The panel needs your distribution's GTK 4 and libadwaita. On GNOME, install the
      Otto extension from extensions.gnome.org, or copy
        #{opt_share}/gnome-shell/extensions/otto@therogue76.github.io
      to ~/.local/share/gnome-shell/extensions and log out and back in.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/otto --version")
  end
end
