class OttoHarness < Formula
  desc "Lets coding agents see and operate Linux desktop apps and Android devices"
  homepage "https://github.com/TheRogue76/otto-harness"
  version "2.2.0"
  license "MIT"

  on_intel do
    url "https://github.com/TheRogue76/otto-harness/releases/download/v#{version}/otto-harness-#{version}-linux-x86_64.tar.gz"
    sha256 "e043d7952f5e805549bb8b49911409b4736ebb92a40d69dcd855887180be6d4e"
  end
  on_arm do
    url "https://github.com/TheRogue76/otto-harness/releases/download/v#{version}/otto-harness-#{version}-linux-aarch64.tar.gz"
    sha256 "2d6ddc441deb9dfe57b181084abf1e99b979ddb0f2387cf23f145e0adc00d1d5"
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
