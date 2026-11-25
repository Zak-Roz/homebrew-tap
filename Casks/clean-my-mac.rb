cask "clean-my-mac" do
  version "0.1.0"
  sha256 "58f33097f1a1c77f08db1e5f46b742a34f2bf73a0ca4e2bf3adbee85c15057ad"

  url "https://github.com/Zak-Roz/clean-my-mac/releases/download/v#{version}/clean-my-mac.zip"
  name "clean-my-mac"
  desc "Rule-based disk cleaner for developer Macs"
  homepage "https://github.com/Zak-Roz/clean-my-mac"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "clean-my-mac.app"
  binary "#{appdir}/clean-my-mac.app/Contents/MacOS/cmm"

  # The daily background scan is a LaunchAgent that runs the cmm inside the app.
  uninstall launchctl: "com.zak-roz.clean-my-mac.scan",
            quit:      "com.zak-roz.clean-my-mac"

  zap trash: [
    "~/Library/Application Support/clean-my-mac",
    "~/Library/Caches/com.zak-roz.clean-my-mac",
    "~/Library/HTTPStorages/com.zak-roz.clean-my-mac",
    "~/Library/LaunchAgents/com.zak-roz.clean-my-mac.scan.plist",
    "~/Library/Preferences/com.zak-roz.clean-my-mac.plist",
    "~/Library/Saved Application State/com.zak-roz.clean-my-mac.savedState",
    "~/Library/WebKit/com.zak-roz.clean-my-mac",
  ]

  caveats <<~CAVEATS
    clean-my-mac is signed with a self-signed certificate and is not notarized.
    The first time you open it, macOS blocks it: open
      System Settings > Privacy & Security
    and click "Open Anyway" next to the message about clean-my-mac.

    Give it Full Disk Access (System Settings > Privacy & Security >
    Full Disk Access), or it cannot measure the Trash or clean protected
    caches. Updates keep the grant: every release is signed with the same
    certificate.

    `cmm` is on your PATH; in a terminal it has the Full Disk Access of
    your terminal app.

    Homebrew 7 and later load this cask only while it is trusted. Keep it
    trusted to get updates:
      brew trust --cask zak-roz/tap/clean-my-mac
  CAVEATS
end
