[![Swift](https://img.shields.io/badge/Swift-4.2-orange.svg)](https://swift.org)
[![Xcode](https://img.shields.io/badge/Xcode-10.0-blue.svg)](https://developer.apple.com/xcode)
[![MIT](https://img.shields.io/badge/License-MIT-red.svg)](https://opensource.org/licenses/MIT)
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/UserAvatarView.svg)](https://cocoapods.org/pods/UserAvatarView)

# UserAvatarView

UserAvatarView is a UIView container subclass that wraps:
- UIImageView
- status view with customizable: appearance, angle, radius

![Demo](https://github.com/AntonPoltoratskyi/UserAvatarView/blob/master/Example/UserAvatarViewDemo.gif)

## Requirements:
- iOS 10.0+
- Xcode 10.0+
- Swift 4.2+

## Installation

#### CocoaPods

```ruby
target 'MyApp' do
  pod 'UserAvatarView', '~> 1.2'
end
```

#### Carthage

```ogdl
github "AntonPoltoratskyi/UserAvatarView" "master"
```

## Usage

1) Declare UserAvatarView either in storyboard:
```swift
@IBOutlet weak var avatarView: UserAvatarView!
```
or programmatically.

2) Setup appropriate properties:
```swift
avatarView.statusAppearance = .color(.red) 
// avatarView.statusAppearance = .image(UIImage(named: "..."))
// avatarView.statusAppearance = .none

avatarView.statusAngle = .pi / 4

avatarView.statusIconSize = 8

avatarView.statusIconPadding = 2
```

3) UIImageView subview is public, so you can setup avatar image on `imageView`:
```swift
avatarView.imageView.image = avatarImage
```

## Author

Anton Poltoratskyi

## License

UserAvatarView is available under the MIT license. See the [LICENSE](https://github.com/AntonPoltoratskyi/UserAvatarView/blob/master/LICENSE) file for more info.
