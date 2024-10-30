cask "tak-cli" do
    version "11.28.0"
    sha256 arm:   "5dd5ae95fe0c2e1b4d8dfc9d76b4f7c1ef77cd68145485b802473f6baa6b7f88",
           intel: "07bbd6f92133ab3009dc9d5dac3608ec01cfa32481701fb966139313bca6d797"
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