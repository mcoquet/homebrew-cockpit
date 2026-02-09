cask "cockpit" do
  version "0.7.2"

  on_arm do
    sha256 "619a7e4955857d39f573bb167520d68035b3235cee80d36d17de992c737e585f"
    url "https://github.com/mcoquet/cockpit/releases/download/v0.7.2/Cockpit-#{version}-arm64.dmg"
  end

  on_intel do
    sha256 "e8ded8f1a6250e5f4745876dbc01fd00efccf7ad1078996623fda70594281c92"
    url "https://github.com/mcoquet/cockpit/releases/download/v0.7.2/Cockpit-#{version}-x64.dmg"
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
