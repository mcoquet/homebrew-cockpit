cask "cockpit" do
  version "0.8.5"

  on_arm do
    sha256 "5725957cbb3610b1a45f403cceb9d620dae70229134d0ef2ef277ffbf29fd5e5"
    url "https://github.com/mcoquet/cockpit/releases/download/v0.8.5/Cockpit-#{version}-arm64.dmg"
  end

  on_intel do
    sha256 "503d819c52d3fc12a03ddaf1caa999bb108a06684f2259b8a3e157ef21eac44b"
    url "https://github.com/mcoquet/cockpit/releases/download/v0.8.5/Cockpit-#{version}-x64.dmg"
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
