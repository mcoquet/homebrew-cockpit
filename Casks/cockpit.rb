cask "cockpit" do
  version "0.7.0"

  on_arm do
    sha256 "b7caa43235f2d41bc4c65df4bbb6274a82d0f417a5234b49b24c594bd3a0eb57"
    url "https://github.com/mcoquet/cockpit/releases/download/v0.7.0/Cockpit-#{version}-arm64.dmg"
  end

  on_intel do
    sha256 "bc14842518f768282da2d62f50a27e7c3f6218219dcf7baa8701e50f96add991"
    url "https://github.com/mcoquet/cockpit/releases/download/v0.7.0/Cockpit-#{version}-x64.dmg"
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
