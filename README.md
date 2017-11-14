__Work in progress__ - Documentation not completed yet

# nibbable

[![CI Status][image-1]][1]
[![Version][image-2]][2]
[![License][image-3]][3]
[![Platform][image-4]][4]

## Goal

It's known that

## Example

Mark with the `@IBDesignable` attribute to enable real time preview in _Interface Builder_.

Ensure that a view is not empty, and that the view in the storyboard doesn’t have any control.
When a view controller is instantiated via a storyboard, the main view is loaded from the storyboard file. The framework overrides `awakeAfter(using:)` to replace that with one deserialized from the view’s XIB file.

However, regardless of whether the view is deserialized from the storyboard or from the XIB, `awakeAfter()`  

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

nibbable is available through [CocoaPods][5]. To install
it, simply add the following line to your Podfile:

```ruby
pod "nibbable"
```

## Author

Antonio Bello

## License

nibbable is available under the MIT license. See the LICENSE file for more info.

[1]:	https://travis-ci.org/jeden/nibbable
[2]:	http://cocoapods.org/pods/nibbable
[3]:	http://cocoapods.org/pods/nibbable
[4]:	http://cocoapods.org/pods/nibbable
[5]:	http://cocoapods.org

[image-1]:	http://img.shields.io/travis/jeden/nibbable.svg?style=flat
[image-2]:	https://img.shields.io/cocoapods/v/nibbable.svg?style=flat
[image-3]:	https://img.shields.io/cocoapods/l/nibbable.svg?style=flat
[image-4]:	https://img.shields.io/cocoapods/p/nibbable.svg?style=flat
