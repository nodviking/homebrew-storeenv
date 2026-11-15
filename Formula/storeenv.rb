class Storeenv < Formula
  desc "Git for .env files: encrypted, versioned environment secrets"
  homepage "https://storeenv.app"
  version "0.2.4"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/tusharrr0302/homebrew-storeenv/releases/download/v0.2.4/storeenv-darwin-arm64.tar.gz"
      sha256 "fa5eb211b5a13c84a88edbdaceb40e065754400a59874ef0ef59c205d75c63ad"
    end
    on_intel do
      url "https://github.com/tusharrr0302/homebrew-storeenv/releases/download/v0.2.4/storeenv-darwin-x64.tar.gz"
      sha256 "71e7882bb0dbe79446609a6a036a9ef1aed6be365d74e38215ee4be21355ca9f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tusharrr0302/homebrew-storeenv/releases/download/v0.2.4/storeenv-linux-arm64.tar.gz"
      sha256 "508ac60bfd85a9e4518a15724b9d576514ade188291ced19c1396efda2ac5693"
    end
    on_intel do
      url "https://github.com/tusharrr0302/homebrew-storeenv/releases/download/v0.2.4/storeenv-linux-x64.tar.gz"
      sha256 "a4ed4ffa965f2162d58a33a4ebac3c302b6b33a68605c375cfe047b34133a38b"
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
