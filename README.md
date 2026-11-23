# Zak-Roz/homebrew-tap

Homebrew casks maintained by [@Zak-Roz](https://github.com/Zak-Roz).

## Ice

[Ice](https://github.com/Zak-Roz/Ice) is a menu bar manager for macOS. This build carries the community fixes for macOS 27.

```sh
brew tap zak-roz/tap
brew trust --cask zak-roz/tap/ice
brew install --cask zak-roz/tap/ice
```

Homebrew 7 and later only load casks from third-party taps you trust; the `brew trust` line trusts this one cask.

If you have the original Ice from Homebrew, remove it first:

```sh
brew uninstall --cask jordanbaird-ice
```

The cask is updated automatically by the release workflow in [Zak-Roz/Ice](https://github.com/Zak-Roz/Ice/blob/main/.github/workflows/release.yml).
