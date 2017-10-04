# Dropdown
Dropdown in Swift

[![Version](https://img.shields.io/cocoapods/v/Dropdown.svg?style=flat)](http://cocoadocs.org/docsets/Dropdown)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![License](https://img.shields.io/cocoapods/l/Dropdown.svg?style=flat)](http://cocoadocs.org/docsets/Dropdown)
[![Platform](https://img.shields.io/cocoapods/p/Dropdown.svg?style=flat)](http://cocoadocs.org/docsets/Dropdown)

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

**Dropdown** is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'Dropdown', git: 'https://github.com/hyperoslo/Dropdown'
```

**Dropdown** is also available through [Carthage](https://github.com/Carthage/Carthage).
To install just write into your Cartfile:

```ruby
github "hyperoslo/Dropdown"
```

**Dropdown** can also be installed manually. Just download and drop `Sources` folders in your project.

## Author

Hyper Interaktiv AS, ios@hyper.no

## Contributing

We would love you to contribute to **Dropdown**, check the [CONTRIBUTING](https://github.com/hyperoslo/Dropdown/blob/master/CONTRIBUTING.md) file for more info.

## License

**Dropdown** is available under the MIT license. See the [LICENSE](https://github.com/hyperoslo/Dropdown/blob/master/LICENSE.md) file for more info.
