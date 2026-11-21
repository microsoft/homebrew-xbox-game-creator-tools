cask "tak-cli" do
    version "11.42.0"
    sha256 arm:   "500aa5f89b5f43bc6aced4155be745ed20da2eb044f8732763701c0b8773ca49",
           intel: "12aaa6971cf5d16d53a7e8f2404eb10579e139c2d706aec8c3dffb202024e0dd"
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