cask "cockpit" do
  version "0.8.0"

  on_arm do
    sha256 "3acbec3300e8109ea3fac45dcb58f6432e02cff1195e782e5e51d103891a94ca"
    url "https://github.com/mcoquet/cockpit/releases/download/v0.8.0/Cockpit-#{version}-arm64.dmg"
  end

  on_intel do
    sha256 "e4cbecccd657008b5c638a9c3d878e40e3de30bb90a4ee1253eb1bc4b0e97dac"
    url "https://github.com/mcoquet/cockpit/releases/download/v0.8.0/Cockpit-#{version}-x64.dmg"
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
