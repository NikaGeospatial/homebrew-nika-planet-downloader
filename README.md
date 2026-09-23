# Nika Planet Downloader — Homebrew tap

Download large Nika Planet workspace folders straight to a local drive, with
resume and per-file checksums.

```bash
brew install nikageospatial/nika-planet-downloader/nika-planet-downloader
```

Or tap once, then use the short name:

```bash
brew tap nikageospatial/nika-planet-downloader
brew install nika-planet-downloader
```

`brew upgrade nika-planet-downloader` picks up new releases. macOS (Apple
Silicon and Intel) and Linux x86_64.

Usage: <https://github.com/NikaGeospatial/nika-planet-downloader> ·
Guide: <https://docs.nikaplanet.com/guides/manage-file-lake-per-workspace/large-folder-downloads>

## Maintainers

`Formula/nika-planet-downloader.rb` is generated. Its source is
`packaging/homebrew/nika-planet-downloader.rb` in the internal downloader repo,
whose **Homebrew** workflow renders it from each published release's
`SHA256SUMS.txt` and pushes it here. Edit it there — changes made in this repo
are overwritten on the next release.
