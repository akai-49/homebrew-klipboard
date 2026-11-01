cask "klipboard" do
  version "0.4.0"
  sha256 "c5fcbe86b413d731011f0546c25df217e7afeebe360624a26bfc3d14c648c69b"

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
