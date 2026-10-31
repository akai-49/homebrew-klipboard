cask "klipboard" do
  version "0.3.0"
  sha256 "a4d995db15d0cb06d9dfa367d077a3660e5e352690e40d220f5a14b822681623"

  url "https://github.com/akai-49/Klipboard/releases/download/v#{version}/Klipboard-#{version}.dmg"
  name "Klipboard"
  desc "Clipboard history, snippets and paste stack for the menu bar"
  homepage "https://github.com/akai-49/Klipboard"

  auto_updates true
  depends_on macos: ">= :sonoma"

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
