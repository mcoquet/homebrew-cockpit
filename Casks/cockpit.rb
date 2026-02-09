cask "cockpit" do
  version "0.7.3"

  on_arm do
    sha256 "115c8c39e862a0b3961272ffe84bf354665c3037c2b236d01d6289d39b565f36"
    url "https://github.com/mcoquet/cockpit/releases/download/v0.7.3/Cockpit-#{version}-arm64.dmg"
  end

  on_intel do
    sha256 "91fee6abccef871ec6d70bb5f803b7f429ac8cc94a6e22b068bc3fbe0cb3bef8"
    url "https://github.com/mcoquet/cockpit/releases/download/v0.7.3/Cockpit-#{version}-x64.dmg"
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
