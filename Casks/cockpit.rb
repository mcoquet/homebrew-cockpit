cask "cockpit" do
  version "0.6.0"

  on_arm do
    sha256 "d62d5f80338c8f912285f31a0b02672d020942de00aea59be1aea23740b8853a"
    url "https://github.com/mcoquet/cockpit/releases/download/v0.6.0/Cockpit-#{version}-arm64.dmg"
  end

  on_intel do
    sha256 "6366fb0d36f4ad05d3c89894d825589aec37cabf8d47a7cf5bb0ee6712b76760"
    url "https://github.com/mcoquet/cockpit/releases/download/v0.6.0/Cockpit-#{version}-x64.dmg"
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
