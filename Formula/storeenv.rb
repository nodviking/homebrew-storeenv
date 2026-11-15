class Storeenv < Formula
  desc "Git for .env files: encrypted, versioned environment secrets"
  homepage "https://storeenv.app"
  version "0.2.3"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/tusharrr0302/homebrew-storeenv/releases/download/v0.2.3/storeenv-darwin-arm64.tar.gz"
      sha256 "fd31fa9bd4a07c99b3bf88d5ac17732af6fe49a64921a981d3b46c078e116590"
    end
    on_intel do
      url "https://github.com/tusharrr0302/homebrew-storeenv/releases/download/v0.2.3/storeenv-darwin-x64.tar.gz"
      sha256 "9f5b0d0b02e5eab2a660b25ed85e9ab298769a697f2c306631036025f297a82d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tusharrr0302/homebrew-storeenv/releases/download/v0.2.3/storeenv-linux-arm64.tar.gz"
      sha256 "b1116de8df4bfacaa9ab13ffbe0ecf5af98a22816147f5d1908d3bd55ebada64"
    end
    on_intel do
      url "https://github.com/tusharrr0302/homebrew-storeenv/releases/download/v0.2.3/storeenv-linux-x64.tar.gz"
      sha256 "cc8ce29546eb1cbac91040052545c899e1fd04154bd3dd6d2a1f38607f60c70e"
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
