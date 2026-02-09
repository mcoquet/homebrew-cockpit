cask "cockpit" do
  version "0.7.5"

  on_arm do
    sha256 "2fe400da2b55f1ba96cf57e13e189237d600ee2d575bf61da0d7825cb97f2eaa"
    url "https://github.com/mcoquet/cockpit/releases/download/v0.7.5/Cockpit-#{version}-arm64.dmg"
  end

  on_intel do
    sha256 "2fcca9b67c9ba8467064e5c9704356e3d410c9454886dc530a93f5a08796ac44"
    url "https://github.com/mcoquet/cockpit/releases/download/v0.7.5/Cockpit-#{version}-x64.dmg"
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
