cask "macos-harness" do
  version "0.5.0"
  sha256 "c00beb71b473d471c23ac8e0f1c029457c199c93d5d862a7f162227072eeecea"

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
