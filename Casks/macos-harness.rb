cask "macos-harness" do
  version "0.6.0"
  sha256 "db43949edbd0a693b93f3af08bd6c3173174739eb476ec607d27236ba3057aa2"

  url "https://github.com/TheRogue76/macos-harness/releases/download/v#{version}/macOS-Harness-#{version}.zip"
  name "macOS Harness"
  desc "Lets coding agents see and operate macOS apps"
  homepage "https://github.com/TheRogue76/macos-harness"

  depends_on macos: :sequoia

  app "macOS Harness.app"
  binary "#{appdir}/macOS Harness.app/Contents/MacOS/macos-harness"

  uninstall quit: "io.github.therogue76.macos-harness"

  zap trash: [
    "~/.config/macos-harness",
    "~/Library/Application Support/macos-harness",
    "~/Library/Logs/macos-harness",
    "~/Library/Preferences/io.github.therogue76.macos-harness.plist",
  ]

  caveats <<~EOS
    Run `macos-harness doctor`, grant the two permissions from the menu bar icon,
    then connect your agent with `macos-harness setup claude`, `codex` or `pi`.
  EOS
end
