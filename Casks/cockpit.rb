cask "cockpit" do
  version "1.0.0"

  on_arm do
    sha256 "ede74ab73811850ccf32a6342834d0a3dee4fcebf6ca19d82012e336fc5d4f11"
    url "https://github.com/mcoquet/cockpit/releases/download/v0.1.0/Cockpit-#{version}-arm64.dmg"
  end

  on_intel do
    sha256 "a28b504bbd6ed8e0a4529cb9f6b0eefdb320a8e7cf2c9e0fd051ab366adebc01"
    url "https://github.com/mcoquet/cockpit/releases/download/v0.1.0/Cockpit-#{version}-x64.dmg"
  end

  name "Cockpit"
  desc "macOS menubar app for managing Claude Code projects"
  homepage "https://github.com/mcoquet/cockpit"

  app "Cockpit.app"

  zap trash: [
    "~/Library/Application Support/cockpit",
    "~/Library/Preferences/com.cockpit.app.plist",
  ]
end
