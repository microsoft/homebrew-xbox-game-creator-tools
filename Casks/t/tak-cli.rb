cask "tak-cli" do
  version "11.16.0"
  sha256 "c398759070c6bb586aa4cbc47fb4c559e2bcdb7afea9b430f464240910732c22"

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
