cask "cloudmount" do
  version "2.0.1"
  sha256 "7dca6a7ffa956c97cb2d5d87179e3b4342ad1b46b3d94d0268318b6c206ae97a"

  url "https://github.com/ebreen/cloudmount/releases/download/v#{version}/CloudMount-#{version}.dmg"
  name "CloudMount"
  desc "Mount cloud storage as native macOS volumes via FSKit"
  homepage "https://github.com/ebreen/cloudmount"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: ">= :tahoe"

  app "CloudMount.app"

  zap trash: [
    "~/Library/Application Support/com.cloudmount.app",
    "~/Library/Caches/com.cloudmount.app",
    "~/Library/HTTPStorages/com.cloudmount.app",
    "~/Library/Preferences/com.cloudmount.app.plist",
    "~/Library/Saved Application State/com.cloudmount.app.savedState",
  ]

  caveats <<~EOS
    CloudMount requires macOS 26 (Tahoe) or later.

    After installation, enable the FSKit extension:
      System Settings -> General -> Login Items & Extensions -> CloudMount

    Mount a volume:  Use the CloudMount menu bar app, or run: mount -t b2 b2://bucket /mount/point
    Unmount:          Use the menu bar app, or run: diskutil unmount /mount/point

    For help: https://github.com/ebreen/cloudmount
  EOS
end
