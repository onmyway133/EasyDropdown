# Dropdowns
Dropdown in Swift

[![Version](https://img.shields.io/cocoapods/v/Dropdowns.svg?style=flat)](http://cocoadocs.org/docsets/Dropdowns)
[![License](https://img.shields.io/cocoapods/l/Dropdowns.svg?style=flat)](http://cocoadocs.org/docsets/Dropdowns)
[![Platform](https://img.shields.io/cocoapods/p/Dropdowns.svg?style=flat)](http://cocoadocs.org/docsets/Dropdowns)
![Swift](https://img.shields.io/badge/%20in-swift%204.0-orange.svg)

![](Screenshots/dropdown.gif)

## Usage

### Basic

```swift
let items = ["World", "Sports", "Culture", "Business", "Travel"]
let titleView = TitleView(navigationController: navigationController!, title: "Menu", items: items)
titleView?.action = { [weak self] index in
  print("select \(index)")
}

navigationItem.titleView = titleView
```

### Customization

```swift
let contentController = TableController(items: items, initialIndex: 0)
let dropdown = DropdownController(contentController: contentController, navigationController: navigationController)
```

### Configuration

```swift
Config.List.DefaultCell.Text.color = UIColor.redColor()
```



## Installation

**Dropdowns** is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'Dropdowns'
```

**Dropdowns** is also available through [Carthage](https://github.com/Carthage/Carthage).
To install just write into your Cartfile:

```ruby
github "hyperoslo/Dropdowns"
```

**Dropdowns** can also be installed manually. Just download and drop `Sources` folders in your project.

## Author

Hyper Interaktiv AS, ios@hyper.no

## Contributing

We would love you to contribute to **Dropdowns**, check the [CONTRIBUTING](https://github.com/hyperoslo/Dropdown/blob/master/CONTRIBUTING.md) file for more info.

## License

**Dropdowns** is available under the MIT license. See the [LICENSE](https://github.com/hyperoslo/Dropdown/blob/master/LICENSE.md) file for more info.
