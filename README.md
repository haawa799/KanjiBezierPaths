[![Build Status](https://app.bitrise.io/app/37ef11e6d4e933d7/status.svg?token=fySHH7K4Hf_u8D9sRXy5sQ&branch=master)](https://app.bitrise.io/app/37ef11e6d4e933d7)
![Swift version](https://img.shields.io/badge/Swift-5.0-F16D39.svg?style=flat)
![Platforms](https://img.shields.io/badge/platform-iOS%2C%20macOS%2C%20tvOS-556f99.svg)
[![codecov](https://codecov.io/gh/haawa799/KanjiBezierPaths/branch/master/graph/badge.svg)](https://codecov.io/gh/haawa799/KanjiBezierPaths)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

# KanjiBezierPaths
Small realm database with wrapper. Contains ~6k different kanji and radicals vector data. Stored as BezierPath arrays, each beziar path represent one kanji stroke.

## Dependency

- Realm

## Usage

```swift
do {
    let provider = try KanjiProvider()
    let bezierPaths: [UIBezierPath]? = provider.pathesForKanji("数")
} catch {
    debugPrint(error)
}
```


You can then use the array of bezierPaths to draw kanji or to do whatever you like with it.

## Origin

All data comes from this repo https://github.com/KanjiVG/kanjivg.
Long ago I extracted strokes info from svgs inside this repo, and stored them as binary files with array of UIBezierPath encoded to blob. Then I wrote a small python script which stored all this data into small sqlite database. And now since I use Realm in projects which potentially will use this framework, I generated Realm database from that old sqlite db.
