cask "tak-cli" do
    version "11.25.0"
    sha256 arm:   "f2f8fdfeaeca58b29e26b62f8c975d02e7fd7d269b20b4591cccaa2efcfba306",
           intel: "b88c487c33f0a6a4e3f07cdd0b9a44a4f6a3074f5eaea18d05639de5342eba7f"
    arch arm: "osx-arm64", intel: "osx-x64"

    url "https://github.com/microsoft/xbox-game-streaming-tools/releases/download/tak-cli-v#{version}/tak-#{version}-#{arch}.dmg"
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