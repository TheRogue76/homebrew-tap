class OttoHarnessATRc < Formula
  desc "Lets coding agents see and operate Linux desktop apps and Android devices"
  homepage "https://github.com/TheRogue76/otto-harness"
  version "2.1.0"
  license "MIT"

  on_intel do
    url "https://github.com/TheRogue76/otto-harness/releases/download/v#{version}/otto-harness-#{version}-linux-x86_64.tar.gz"
    sha256 "acb16bdc44fc9ab64c8fdac3d4c398af2bac751f1ce376408231031a93d92b3d"
  end
  on_arm do
    url "https://github.com/TheRogue76/otto-harness/releases/download/v#{version}/otto-harness-#{version}-linux-aarch64.tar.gz"
    sha256 "8cfd2115739d66d089b57322e426dfa593eaf45a689e5262ea547e4175c60590"
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
