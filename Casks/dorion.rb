cask "dorion" do
  version "6.13.2"

  on_arm do
    sha256 "cecada0f44b810b5567cab5588b45abbe68529c8f524742b30faa1eebcadeb65"

    url "https://github.com/SpikeHD/Dorion/releases/download/v#{version}/Dorion_#{version}_aarch64.dmg"
  end
  on_intel do
    sha256 "e30cd5e0b5f17c5b9f9cf1aca1a0610c2db2a1b5270a9ef506f6faf7ae784a45"

    url "https://github.com/SpikeHD/Dorion/releases/download/v#{version}/Dorion_#{version}_x64.dmg"
  end

  name "Dorion"
  desc "Alternative Discord client aimed towards lower-spec devices"
  homepage "https://github.com/SpikeHD/Dorion"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true

  app "Dorion.app"

  zap trash: [
    "~/Library/Application Support/Dorion",
    "~/Library/Preferences/com.dorion.plist",
    "~/Library/Saved Application State/com.dorion.savedState",
  ]

  caveats do
    <<~EOS
      If opening Dorion gives you "Dorion.app is damaged and cannot be opened", MacOS is lying to you and you may just need to run:

        sudo xattr -rd com.apple.quarantine /Applications/Dorion.app

      Alternatively, you can open the Privacy & Security settings pane and scroll down to the Security section to remove the quarantine.
    EOS
  end
end
