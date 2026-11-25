cask "ice" do
  version "0.12.2"
  sha256 "df120a09e4beb83ca1e414c2c547ff390d2b95244a331d1f255416275ac4edca"

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
