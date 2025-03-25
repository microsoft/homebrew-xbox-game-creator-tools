cask "tak-cli" do
    version "11.36.0"
    sha256 arm:   "5b11cce98dbd5aa76714f1d27688c3cf71699e6b9b47cf421df3b5418f9a5dd7",
           intel: "b4a569ffaedf1234e48828c1a12feed214e5e4d2012fdd0e221b1db22828a895"
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