cask "tak-cli" do
  version "11.0.0"
  sha256 "2f00f662e08d7cb2aa049975b30689fca2e754e967ad53f298815ad2a7d0eb37"

  url "https://github.com/microsoft/xbox-game-streaming-tools/releases/download/tak-cli-v#{version}/tak-#{version}.dmg"
  name "Touch Adaptation Kit Command Line Tool (TAK CLI)"
  desc "Command-line tool for creating and managing touch adaptation bundles for Xbox"
  homepage "https://github.com/microsoft/xbox-game-streaming-tools"

  livecheck do
    regex(/tak-cli-v(\d+(?:\.\d+)+)/i) # tags like `tak-cli-v11.0.0`
  end

  binary "tak"

  postflight do
    system_command "/bin/chmod", args: ["+x", "#{staged_path}/tak"]
  end

  uninstall delete: "#{HOMEBREW_PREFIX}/bin/tak"

  zap trash: "~/Library/Application Support/Microsoft/Xbox Creator Tools/TAK CLI"
end
