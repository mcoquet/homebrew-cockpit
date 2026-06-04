cask "cockpit" do
  version "0.8.4"

  on_arm do
    sha256 "9f7ea571e61fc3e3d99779e2243c92c07f3233343061356013dbc41764f3eaf6"
    url "https://github.com/mcoquet/cockpit/releases/download/v0.8.4/Cockpit-#{version}-arm64.dmg"
  end

  on_intel do
    sha256 "71f8c11529db3ee59863c38cec0e95c3309d7312dce82f342b6008e9996bc7dc"
    url "https://github.com/mcoquet/cockpit/releases/download/v0.8.4/Cockpit-#{version}-x64.dmg"
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
