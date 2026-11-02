cask "klipboard" do
  version "0.4.1"
  sha256 "bfc54ca382cca6069e42805c40ff2a8a2ff5d9463fc02e65dd210f8da4cf247c"

  url "https://github.com/akai-49/Klipboard/releases/download/v#{version}/Klipboard-#{version}.dmg"
  name "Klipboard"
  desc "Clipboard history, snippets and paste stack for the menu bar"
  homepage "https://github.com/akai-49/Klipboard"

  auto_updates true
  depends_on macos: :sonoma

  app "Klipboard.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Klipboard.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/Klipboard",
    "~/Library/Preferences/com.abhishek.Klipboard.plist",
  ]
end
