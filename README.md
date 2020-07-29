# TTGaugeView

A light weight gauge view written in SwiftUI.

<img src="https://raw.githubusercontent.com/honkmaster/TTGaugeView/master/Sample.png" width="300">

## Installation

Xcode 11 and iOS 13 is required.

### Swift Package Manager

* Xcode: File -> Swift Packages -> Add Package Dependenc
* Paste https://github.com/honkmaster/TTGaugeView

### Manually

Drag `TTGaugeView.swift` into your project.

## Usage

### Import

Import the `TTGaugeView` in the file you would like to use it: 

```swift
import TTGaugeView
```

### Instantiate view

```swift
let angle: Double = 260.0
let sections: [TTGaugeViewSection] = [TTGaugeViewSection(color: .green, size: 0.1),
                                      TTGaugeViewSection(color: .yellow, size: 0.1),
                                      TTGaugeViewSection(color: .orange, size: 0.1),
                                      TTGaugeViewSection(color: .red, size: 0.1),
                                      TTGaugeViewSection(color: .purple, size: 0.2),
                                      TTGaugeViewSection(color: .blue, size: 0.4)]

let valueDescription = "\(Int(value * 100)) %"
let gaugeDescription = "My SwiftUI Gauge"

TTGaugeView(angle: angle, sections: sections, value: value, valueDescription: valueDescription, gaugeDescription: gaugeDescription)
```

## Contributing to this project

If you have feature requests or bug reports, feel free to help out by sending pull requests or by [creating new issues](https://github.com/honkmaster/TTGaugeView/issues/new). Please take a moment to
review the guidelines written by [Nicolas Gallagher](https://github.com/necolas):

* [Bug reports](https://github.com/necolas/issue-guidelines/blob/master/CONTRIBUTING.md#bugs)
* [Feature requests](https://github.com/necolas/issue-guidelines/blob/master/CONTRIBUTING.md#features)
* [Pull requests](https://github.com/necolas/issue-guidelines/blob/master/CONTRIBUTING.md#pull-requests)

## License

`TTGaugeView` is distributed under the terms and conditions of the [MIT license](hhttps://github.com/honkmaster/TTGaugeView/blob/master/LICENSE).

## Credits

`TTGaugeView` is brought to you by [Tobias Tiemerding](http://tiemerding.com). If you're using `TTGaugeView` in your project, attribution would be very appreciated.
