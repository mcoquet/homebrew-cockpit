cask "cockpit" do
  version "0.4.0"

  on_arm do
    sha256 "09aa2c3463dbdf2c099e5cf5b99a095e6a9d97dcef8b352c5fd13a50739e90de"
    url "https://github.com/mcoquet/cockpit/releases/download/v0.4.0/Cockpit-#{version}-arm64.dmg"
  end

  on_intel do
    sha256 "ea831338c4a1fccbd190d456b852b28ccf88292b3670a54cc2ce60eae9d3a219"
    url "https://github.com/mcoquet/cockpit/releases/download/v0.4.0/Cockpit-#{version}-x64.dmg"
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
