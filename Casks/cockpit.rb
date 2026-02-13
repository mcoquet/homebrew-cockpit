cask "cockpit" do
  version "0.7.11"

  on_arm do
    sha256 "33453925ee4cd5f0751bf3a98eb11e002be6ab7b158113d97117088b770a9b81"
    url "https://github.com/mcoquet/cockpit/releases/download/v0.7.11/Cockpit-#{version}-arm64.dmg"
  end

  on_intel do
    sha256 "0419764d08522f2ed4ef687c9e50bb369ab25637932bf8b3c64316808b5884fd"
    url "https://github.com/mcoquet/cockpit/releases/download/v0.7.11/Cockpit-#{version}-x64.dmg"
  end

  name "Cockpit"
  desc "macOS menubar app for managing Claude Code projects"
  homepage "https://github.com/mcoquet/cockpit"

  app "Cockpit.app"

  # Remove quarantine attribute since app is unsigned
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-d", "com.apple.quarantine", "#{appdir}/Cockpit.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/cockpit",
    "~/Library/Preferences/com.cockpit.app.plist",
  ]
end
