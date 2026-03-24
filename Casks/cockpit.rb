cask "cockpit" do
  version "0.8.1"

  on_arm do
    sha256 "022dfa825c2ed7a83da092b4e7c0a18f359210d8b7d0e987c16d7124e0170473"
    url "https://github.com/mcoquet/cockpit/releases/download/v0.8.1/Cockpit-#{version}-arm64.dmg"
  end

  on_intel do
    sha256 "2c9295be72eccd03a5163c9fcaa1305111fd7efef67e465e24925374da846190"
    url "https://github.com/mcoquet/cockpit/releases/download/v0.8.1/Cockpit-#{version}-x64.dmg"
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
