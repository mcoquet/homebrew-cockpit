cask "cockpit" do
  version "0.7.1"

  on_arm do
    sha256 "1d2e06fde129bff21b05ccd9b95ba5cd44b95f764271062c123b179d12991e6b"
    url "https://github.com/mcoquet/cockpit/releases/download/v0.7.1/Cockpit-#{version}-arm64.dmg"
  end

  on_intel do
    sha256 "8b9dff4736247f475bb7be0e1bccbbbf127f124700020dd280fbc59f8e95f596"
    url "https://github.com/mcoquet/cockpit/releases/download/v0.7.1/Cockpit-#{version}-x64.dmg"
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
