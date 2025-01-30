cask "tak-cli" do
    version "11.35.0"
    sha256 arm:   "7b55a453a93a7b22ef0e3589b8fe5309c8a48d1fe0646b1025ad5b605d1e65a8",
           intel: "127d8faf292cbcc2cfc7fa288b5e2c6f00ab107f99d29ef60eb0548088915205"
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