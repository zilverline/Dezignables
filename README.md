# Dezignables

[![CI Status](http://img.shields.io/travis/zilverline/Dezignables.svg?style=flat)](https://travis-ci.org/zilverline/Dezignables)
[![Version](https://img.shields.io/cocoapods/v/Dezignables.svg?style=flat)](http://cocoapods.org/pods/Dezignables)
[![License](https://img.shields.io/cocoapods/l/Dezignables.svg?style=flat)](http://cocoapods.org/pods/Dezignables)
[![Platform](https://img.shields.io/cocoapods/p/Dezignables.svg?style=flat)](http://cocoapods.org/pods/Dezignables)

A collection of designable components I often use in my iOS projects. For now it includes a UIView, UIButton and UIImageView.

Checkout the Example project to see all available options.

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

Dezignables is available through [CocoaPods](http://cocoapods.org). To install it, simply add the following line to your Podfile:

```ruby
pod "Dezignables"
```

## API

Dezignables are implemented using protocol extensions. The pre-made components include all or most of the dezignables available and are ready to use. You could also apply one or more of the dezignable protocols on your own components.

### Components

| Class               | Dezignables                                                                      |
|---------------------|----------------------------------------------------------------------------------|
| DezignableView      | <ul><li>DezignableBorder</li><li>DezignableCorner</li><li>DezignableRotation</li>|
| DezignableButton    | <ul><li>DezignableBorder</li><li>DezignableCorner</li><li>DezignableRotation</li>|
| DezignableImageView | <ul><li>DezignableBorder</li><li>DezignableCorner</li><li>DezignableRotation</li>|

### Dezignables

#### DezignableBorder

| Property              | Description                                                                                                                                                                                           | Preview            |
|-----------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------|
| borderWidth           | Sets the width of the border in points                                                                                                                                                                | :white_check_mark: |
| borderColor           | Color of the border                                                                                                                                                                                   | :white_check_mark: |
| borderTop             | Draws top border                                                                                                                                                                                      | :white_check_mark: |
| borderBottom          | Draws bottom border                                                                                                                                                                                   | :white_check_mark: |
| borderLeft            | Draws left border                                                                                                                                                                                     | :white_check_mark: |
| borderRight           | Draws right border                                                                                                                                                                                    | :white_check_mark: |
| borderScaleCorrection | Converts the borderWidth to physical pixels. The borderWidth value gets divided by `UIScreen.mainScreen().scale`. To create a hairline border use `borderWidth=1.0` and `borderScaleCorrection=true`. | :white_check_mark: |

#### DezignableCorner

| Property     | Description                                                                                                      | Preview            |
|--------------|------------------------------------------------------------------------------------------------------------------|--------------------|
| cornerRadius | The radius of all four corners, in points                                                                        | :white_check_mark: |
| cornerCircle | Make a full circle based on the height of the view. The preview looks weird when used with `DezignableRotation`. | :white_check_mark: |

#### DezignableRotation

| Property | Description                                  | Preview |
|----------|----------------------------------------------|---------|
| rotation | The amount of degrees the view should rotate | :x:     |


## License

Dezignables is available under the MIT license. See the LICENSE file for more info.
