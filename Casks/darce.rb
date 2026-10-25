cask "darce" do
  version "0.1.0"
  sha256 "fd5f014215427063571fc6d1a9007b877c982b06bb01228c37e71f4f724caf3d"

  url "https://github.com/vinny380/darce/releases/download/v#{version}/Darce-#{version}-arm64.dmg"
  name "D'arce"
  desc "Native browser inspired by Arc"
  homepage "https://github.com/vinny380/darce"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "D'arce.app"

  zap trash: [
    "~/Library/Application Support/Darce",
    "~/Library/Caches/io.github.vinny380.darce",
    "~/Library/HTTPStorages/io.github.vinny380.darce",
    "~/Library/Preferences/io.github.vinny380.darce.plist",
    "~/Library/WebKit/io.github.vinny380.darce",
  ]

  caveats <<~EOS
    D'arce isn't notarized by Apple yet. The first time you open it, go to
    System Settings → Privacy & Security and click "Open Anyway".
  EOS
end
