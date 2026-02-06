cask "cockpit" do
  version "0.3.0"

  on_arm do
    sha256 "c4da22dbd71ce5a67505fb9615f30c5a0a622ab7ffc29d1f3bcbcc56d8147b28"
    url "https://github.com/mcoquet/cockpit/releases/download/v0.3.0/Cockpit-#{version}-arm64.dmg"
  end

  on_intel do
    sha256 "6be3f442037105f32d9ecacfa918a54d2f219eb4c434a76287ade1cd149dd286"
    url "https://github.com/mcoquet/cockpit/releases/download/v0.3.0/Cockpit-#{version}-x64.dmg"
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
