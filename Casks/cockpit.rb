cask "cockpit" do
  version "0.7.8"

  on_arm do
    sha256 "d1f1ab88d10b8b7101e8997b3323d8147839968a538c1a53c97c930f4cbbc97b"
    url "https://github.com/mcoquet/cockpit/releases/download/v0.7.8/Cockpit-#{version}-arm64.dmg"
  end

  on_intel do
    sha256 "1c143b86a1cf4af170a5e1d938596d70351ddad9ecefe7aac48bc7760c0fab97"
    url "https://github.com/mcoquet/cockpit/releases/download/v0.7.8/Cockpit-#{version}-x64.dmg"
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
