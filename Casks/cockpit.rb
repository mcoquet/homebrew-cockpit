cask "cockpit" do
  version "0.8.2"

  on_arm do
    sha256 "82c84f952433d4a1db78c5215aa53234d8ebebcef9f77a2df775638be59abd8e"
    url "https://github.com/mcoquet/cockpit/releases/download/v0.8.2/Cockpit-#{version}-arm64.dmg"
  end

  on_intel do
    sha256 "9c65835d693f696011b3619695c17d349c26d37e4d952bb17354acc56b548eef"
    url "https://github.com/mcoquet/cockpit/releases/download/v0.8.2/Cockpit-#{version}-x64.dmg"
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
