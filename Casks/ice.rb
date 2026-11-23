cask "ice" do
  version "0.12.0"
  sha256 "81fb7da7349ba7710a1d778471dc2fb451e846c5478648e7d243ce7df0a2bd64"

  url "https://github.com/Zak-Roz/Ice/releases/download/v#{version}/Ice.zip"
  name "Ice"
  desc "Menu bar manager to hide, show and rearrange items"
  homepage "https://github.com/Zak-Roz/Ice"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  conflicts_with cask: "jordanbaird-ice"
  depends_on macos: :sonoma

  app "Ice.app"

  # Quitting lets Ice turn back on the "Allow in the Menu Bar" switches
  # it turned off to hide items on macOS 27.
  uninstall quit: "com.jordanbaird.Ice"

  zap trash: [
    "~/Library/Application Support/Ice",
    "~/Library/Caches/com.jordanbaird.Ice",
    "~/Library/HTTPStorages/com.jordanbaird.Ice",
    "~/Library/Preferences/com.jordanbaird.Ice.plist",
  ]

  caveats <<~CAVEATS
    Ice is signed with a self-signed certificate and is not notarized.
    The first time you open it, macOS blocks it: open
      System Settings > Privacy & Security
    and click "Open Anyway" next to the message about Ice.

    Ice needs Accessibility and Screen Recording. If you used another
    build of Ice before, remove its entries there first, then grant
    them again; later updates keep them.
  CAVEATS
end
