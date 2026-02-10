cask "cockpit" do
  version "0.7.7"

  on_arm do
    sha256 "b0e86b904126f0b8b97efa24a91e3ece5ef14d3fa4b3b216cb3abc656744848a"
    url "https://github.com/mcoquet/cockpit/releases/download/v0.7.7/Cockpit-#{version}-arm64.dmg"
  end

  on_intel do
    sha256 "65789024d8f99a30da9fc31b9d34843d18275a394baa397e24e11abe7e307dc5"
    url "https://github.com/mcoquet/cockpit/releases/download/v0.7.7/Cockpit-#{version}-x64.dmg"
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
