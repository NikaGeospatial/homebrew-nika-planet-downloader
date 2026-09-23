# Rendered from packaging/homebrew/nika-planet-downloader.rb in
# NikaGeospatial/nika-planet-downloader-internal by the Homebrew workflow.
# Edit it there: changes made in the tap are overwritten on the next release.
class NikaPlanetDownloader < Formula
  desc "Download large Nika Planet workspace folders with resume and checksums"
  homepage "https://github.com/NikaGeospatial/nika-planet-downloader"

  # The version lives in the URLs rather than a `version` line: Homebrew reads
  # it from there, and audit rejects a separate stanza as redundant.
  on_macos do
    # One universal (arm64 + x86_64) binary, Developer ID signed and notarized,
    # so both architectures fetch the same archive.
    on_arm do
      url "https://github.com/NikaGeospatial/nika-planet-downloader/releases/download/v0.1.1/nika-planet-downloader-0.1.1-macos-universal.tar.gz"
      sha256 "7248b54aa1bccdb59af881ef4c37e3e2d927e0f2ccff12b1d439cc913e4e0ba6"
    end

    on_intel do
      url "https://github.com/NikaGeospatial/nika-planet-downloader/releases/download/v0.1.1/nika-planet-downloader-0.1.1-macos-universal.tar.gz"
      sha256 "7248b54aa1bccdb59af881ef4c37e3e2d927e0f2ccff12b1d439cc913e4e0ba6"
    end
  end

  on_linux do
    # Only an x86_64 Linux build is published. The arm64 branch names the same
    # archive purely so the formula still loads there — with no URL at all it
    # is "Invalid formula" — and the requirement below then refuses the install
    # with a readable message before anything is downloaded.
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/NikaGeospatial/nika-planet-downloader/releases/download/v0.1.1/nika-planet-downloader-0.1.1-linux-x86_64.tar.gz"
      sha256 "9e06a726e1ee8318cbf757f5750ef14ed7b9083d614dc4dda55186fc2f9f2a3f"
    end

    on_arm do
      url "https://github.com/NikaGeospatial/nika-planet-downloader/releases/download/v0.1.1/nika-planet-downloader-0.1.1-linux-x86_64.tar.gz"
      sha256 "9e06a726e1ee8318cbf757f5750ef14ed7b9083d614dc4dda55186fc2f9f2a3f"
    end
  end

  def install
    bin.install "nika-planet-downloader"
  end

  def caveats
    <<~EOS
      Sign in once, then download a folder by its nikafs:// address:
        nika-planet-downloader login
        nika-planet-downloader export nikafs://<project-id>/data/<folder> --output ~/Downloads
    EOS
  end

  test do
    assert_match "nika-planet-downloader #{version}",
                 shell_output("#{bin}/nika-planet-downloader --version")
  end
end
