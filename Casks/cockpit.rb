cask "cockpit" do
  version "0.2.0"

  on_arm do
    sha256 "041c3c289baa74fc00715df5eea4699264245cd442b379a2177ea2ad99fab716"
    url "https://github.com/mcoquet/cockpit/releases/download/v0.2.0/Cockpit-#{version}-arm64.dmg"
  end

  on_intel do
    sha256 "1aae83fd7a56239f3aa7e0bc7b606d4d42d87995aac8af8099742f2b03bf5bdb"
    url "https://github.com/mcoquet/cockpit/releases/download/v0.2.0/Cockpit-#{version}-x64.dmg"
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
