cask "cockpit" do
  version "0.7.9"

  on_arm do
    sha256 "d5173d2f6d1aa287aa1623a0158c9d7787810a731ad114ed242bf4f899443709"
    url "https://github.com/mcoquet/cockpit/releases/download/v0.7.9/Cockpit-#{version}-arm64.dmg"
  end

  on_intel do
    sha256 "634ff4626458d48eeb8a984ed7785ccade766cbb83317b4e307e8ce79df33dd5"
    url "https://github.com/mcoquet/cockpit/releases/download/v0.7.9/Cockpit-#{version}-x64.dmg"
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
