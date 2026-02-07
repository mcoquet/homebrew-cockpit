cask "cockpit" do
  version "0.5.0"

  on_arm do
    sha256 "5ad78d5961e991f01d93b5b0cbd3f88bec24277b9c2ae2d200bf833a699ae694"
    url "https://github.com/mcoquet/cockpit/releases/download/v0.5.0/Cockpit-#{version}-arm64.dmg"
  end

  on_intel do
    sha256 "ee9c32fd8e3f9c2df0c4338d60b05ebe6f035e4c724aa5f3c2572e11e5ab457a"
    url "https://github.com/mcoquet/cockpit/releases/download/v0.5.0/Cockpit-#{version}-x64.dmg"
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
