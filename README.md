[![BuildStatus](https://travis-ci.org/haawa799/KanjiBezierPaths.svg?branch=master)](https://travis-ci.org/haawa799/KanjiBezierPaths)
![Platforms](https://img.shields.io/badge/platform-iOS%2C%20macOS%2C%20tvOS-556f99.svg)
[![codecov](https://codecov.io/gh/haawa799/KanjiBezierPaths/branch/master/graph/badge.svg)](https://codecov.io/gh/haawa799/KanjiBezierPaths)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

# KanjiBezierPaths
Small realm database with all kanji strokes data.

## Dependency

- Realm

## Usage

```
let provider = KanjiProvider()
guard let bezierPaths: [UIBezierPath] = provider.pathesForKanji("数")
debugPrint(bezierPaths.count)
```

You can then use the array of bezierPaths to draw kanji or to do whatever you like with it.

## Origin

All data comes from this repo https://github.com/KanjiVG/kanjivg.
Long ago I extracted strokes info from svgs inside this repo, and stored them as binary files with array of UIBezierPath encoded to blob. Then I wrote a small python script which stored all this data into small sqlite database. And now since I use Realm in projects which potentially will use this framework, I generated Realm database from that old sqlite db.
