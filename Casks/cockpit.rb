cask "cockpit" do
  version "0.7.4"

  on_arm do
    sha256 "a26fecf5fa026b2079996f7614f401f359c7af6c11d0a26059bbe49e2e939c35"
    url "https://github.com/mcoquet/cockpit/releases/download/v0.7.4/Cockpit-#{version}-arm64.dmg"
  end

  on_intel do
    sha256 "40176c2fe5a1f34f5ba28bbaeee68df3c51e68ddb6f7fc4a87546b279b555fbc"
    url "https://github.com/mcoquet/cockpit/releases/download/v0.7.4/Cockpit-#{version}-x64.dmg"
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
