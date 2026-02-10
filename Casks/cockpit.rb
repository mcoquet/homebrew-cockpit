cask "cockpit" do
  version "0.7.10"

  on_arm do
    sha256 "4979daba8d70ec6ceea41b0da83e0f1df70d7a33700b4efd9f576496e7b255e3"
    url "https://github.com/mcoquet/cockpit/releases/download/v0.7.10/Cockpit-#{version}-arm64.dmg"
  end

  on_intel do
    sha256 "054338b823662fb41d78d0770cf067bb88028606e06d708c9e0c8d223edaa357"
    url "https://github.com/mcoquet/cockpit/releases/download/v0.7.10/Cockpit-#{version}-x64.dmg"
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
