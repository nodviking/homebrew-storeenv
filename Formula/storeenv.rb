class Storeenv < Formula
  desc "Git for .env files: encrypted, versioned environment secrets"
  homepage "https://storeenv.app"
  version "0.2.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/tusharrr0302/homebrew-storeenv/releases/download/v0.2.2/storeenv-darwin-arm64.tar.gz"
      sha256 "7842abda78058e882a2a37beddb44df242d07198bcaae31572559a4f15186425"
    end
    on_intel do
      url "https://github.com/tusharrr0302/homebrew-storeenv/releases/download/v0.2.2/storeenv-darwin-x64.tar.gz"
      sha256 "ac66748b3b5b59fa94f3ebfb6c1d2636211f39c6ea4b14fb2a12df953da23879"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tusharrr0302/homebrew-storeenv/releases/download/v0.2.2/storeenv-linux-arm64.tar.gz"
      sha256 "5db4612068bce0c14950fc401bd4295ed21a18e2cf621dbc0c608895daac5419"
    end
    on_intel do
      url "https://github.com/tusharrr0302/homebrew-storeenv/releases/download/v0.2.2/storeenv-linux-x64.tar.gz"
      sha256 "de7974e07a0504312358916829b8a1fd830c80f1845f709f5150c1a20e28aabc"
    end
  end

  def install
    bin.install "storeenv"
    # The license and notices for StoreEnv, the bundled packages and the
    # embedded Node.js runtime (archives from 0.2.0 on carry them).
    %w[LICENSE THIRD_PARTY_NOTICES.md LICENSE-node.txt].each { |notice| doc.install notice if File.exist?(notice) }
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/storeenv --version").strip
  end
end
