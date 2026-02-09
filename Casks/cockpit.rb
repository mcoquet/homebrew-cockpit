cask "cockpit" do
  version "0.7.6"

  on_arm do
    sha256 "432faf1ed00e7cd0f77c52cd3d789cd0c5907c47086694f9206c379ae1870122"
    url "https://github.com/mcoquet/cockpit/releases/download/v0.7.6/Cockpit-#{version}-arm64.dmg"
  end

  on_intel do
    sha256 "1910df97699e03fe12469a8c2ce6c9aec24068ed04bc01da6467a1c09ac56c2d"
    url "https://github.com/mcoquet/cockpit/releases/download/v0.7.6/Cockpit-#{version}-x64.dmg"
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
