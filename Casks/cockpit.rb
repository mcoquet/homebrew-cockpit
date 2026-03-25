cask "cockpit" do
  version "0.8.3"

  on_arm do
    sha256 "5935f61050a17e6b216c9ef665910c8526aae1ba2b2b4a33d9359aed6c929d1d"
    url "https://github.com/mcoquet/cockpit/releases/download/v0.8.3/Cockpit-#{version}-arm64.dmg"
  end

  on_intel do
    sha256 "2158f59ec14d82ab305655344b96a2408e9810903dbcadc5f29bbc01437495aa"
    url "https://github.com/mcoquet/cockpit/releases/download/v0.8.3/Cockpit-#{version}-x64.dmg"
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
