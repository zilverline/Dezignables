# Dezignables

[![CI Status](http://img.shields.io/travis/zilverline/Dezignables.svg?style=flat)](https://travis-ci.org/zilverline/Dezignables)
[![Version](https://img.shields.io/cocoapods/v/Dezignables.svg?style=flat)](http://cocoapods.org/pods/Dezignables)
[![License](https://img.shields.io/cocoapods/l/Dezignables.svg?style=flat)](http://cocoapods.org/pods/Dezignables)
[![Platform](https://img.shields.io/cocoapods/p/Dezignables.svg?style=flat)](http://cocoapods.org/pods/Dezignables)

A collection of designable components I often use in my iOS projects. Checkout the Example project to see all available options.

## Example

To run the example project, clone the repo, and run `carthage bootstrap --no-use-binaries --platform ios` from the Example directory first.

## Installation

Dezignables is available through [CocoaPods](http://cocoapods.org). To install it, simply add the following line to your Podfile:

```ruby
pod "Dezignables"
```

## API

Dezignables are implemented using protocol extensions. The pre-made components include all or most of the dezignables available and are ready to use. You could also apply one or more of the dezignable protocols on your own components.

### Components

| Class                         | Dezignables                                                                                                                                                                                                                                                                                                                                                         |
|-------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| DezignableView                | <ul><li>DezignableBorder</li><li>DezignableCorner</li><li>DezignableRotation</li><li>DezignableBackground</li><li>DezignableShadow</li></ul>                                                                                                                                                                                                                        |
| DezignableButton              | <ul><li>DezignableBorder</li><li>DezignableCorner</li><li>DezignableRotation</li><li>DezignableBackground</li><li>DezignableShadow</li><li>DezignableHighlight</li></ul>                                                                                                                                                                                            |
| DezignableImageView           | <ul><li>DezignableBorder</li><li>DezignableCorner</li><li>DezignableRotation</li><li>DezignableBackground</li><li>DezignableShadow</li></ul>                                                                                                                                                                                                                        |
| DezignableLabel               | <ul><li>DezignableBorder</li><li>DezignableCorner</li><li>DezignableRotation</li><li>DezignableBackground</li><li>DezignableShadow</li></ul>                                                                                                                                                                                                                        |
| DezignableTableViewController | <ul><li>Fixes an issue with the swipe-back-gesture. When swiping back really fast to a table view controller, the selection of the cell would not be cleared. This component fixes this issue.</li><li>Can be used with static tables, designed in Interface Builder.<li>DezignableSeparator</li><li>DezignableHighlight</li><li>DezignableHiddenSections</li></ul> |
| DezignableViewController      | <ul><li>DezignableHiddenNavigationBar</li><li>DezignableStatusBar</li></ul>                                                                                                                                                                                                                                                                                         |

### Dezignables

#### DezignableBorder

| Property              | Description                                                                                                                                                                                               | Preview            |
|-----------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------|
| borderWidth           | Sets the width of the border in points                                                                                                                                                                    | :white_check_mark: |
| borderColor           | Color of the border                                                                                                                                                                                       | :white_check_mark: |
| borderTop             | Draws top border                                                                                                                                                                                          | :white_check_mark: |
| borderBottom          | Draws bottom border                                                                                                                                                                                       | :white_check_mark: |
| borderLeft            | Draws left border                                                                                                                                                                                         | :white_check_mark: |
| borderRight           | Draws right border                                                                                                                                                                                        | :white_check_mark: |
| borderScaleCorrection | Converts the `borderWidth` to physical pixels. The `borderWidth` value gets divided by `UIScreen.mainScreen().scale`. To create a hairline border use `borderWidth=1.0` and `borderScaleCorrection=true`. | :white_check_mark: |

#### DezignableCorner

| Property     | Description                                                                                                     | Preview            |
|--------------|-----------------------------------------------------------------------------------------------------------------|--------------------|
| cornerRadius | The radius of all four corners, in points                                                                       | :white_check_mark: |
| cornerCircle | Make a full circle based on the height of the view. The preview looks weird when used with `DezignableRotation` | :white_check_mark: |

#### DezignableRotation

| Property | Description                                  | Preview |
|----------|----------------------------------------------|---------|
| rotation | The amount of degrees the view should rotate | :x:     |

#### DezignableBackground

| Property                     | Description                                 | Preview            |
|------------------------------|---------------------------------------------|--------------------|
| backgroundFillColor          | Fill the view with a solid color            | :white_check_mark: |
| backgroundGradientStartColor | Start color of the gradient                 | :white_check_mark: |
| backgroundGradientStopColor  | Stop color of the gradient                  | :white_check_mark: |
| backgroundGradientStartPoint | Position of the start color in the gradient | :white_check_mark: |
| backgroundGradientStopPoint  | Position of the stop color in the gradient  | :white_check_mark: |

#### DezignableShadow

When you want to use `DezignableShadow` together with `DezignableBorder` you'll need to use two different views and lay them out exactly on top of each other. See the Example app for a demo.

| Property         | Description                                                                | Preview |
|------------------|----------------------------------------------------------------------------|---------|
| boxShadowColor   | The color of the shadow                                                    | :x:     |
| boxShadowRadius  | How far out the shadow will spread                                         | :x:     |
| boxShadowOpacity | How transparant the shadow will be. 0.0 is invisible, 1.0 is fully visible | :x:     |
| boxShadowOffset  | From what point the shadow will draw                                       | :x:     |

#### DezignableSeparator

This is a table cell separator that doesn't dissapear when selecting the cell. Cells need to be a subclass of `DezignableTableViewCell`, or you can use `DezignableTableViewCell` directly.

| Property                 | Description                                                                                                                                                                                                        | Preview |
|--------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------|
| separatorColor           | The color of the separator                                                                                                                                                                                         | :x:     |
| separatorWidth           | The width of the separator, in points                                                                                                                                                                              | :x:     |
| separatorScaleCorrection | Converts the `separatorWidth` to physical pixels. The `separatorWidth` value gets divided by `UIScreen.mainScreen().scale`. To create a hairline border use `separatorWidth=1.0` and `borderScaleCorrection=true`. | :x:     |

#### DezignableHiddenSections

These functions can be called from a subclass of `DezignableTableViewController` or directly on the controller.

| Function                              | Description                                                               | Preview |
|---------------------------------------|---------------------------------------------------------------------------|---------|
| hideSection(section: Int)             | Hides the given section (section index is zero-based)                     | :x:     |
| showSection(section: Int)             | Shows the given section (section index is zero-based)                     | :x:     |
| isSectionHidden(section: Int) -> Bool | Returns `true` when given section is hidden (section index is zero-based) | :x:     |

#### DezignableHighlight

A custom highlight and selection background color for table cells and buttons. Cells need to be a subclass of `DezignableTableViewCell` or you can use `DezignableTableViewCell` directly.

| Property                 | Description                                                                                                         | Preview                                |
|--------------------------|---------------------------------------------------------------------------------------------------------------------|----------------------------------------|
| selectedBackgroundColor  | The color used when the cell is selected                                                                            | Cell: :x: - Button: :white_check_mark: |
| highlightBackgroundColor | The color used when the cell is highlighted, for cells the `selectedBackgroundColor` is used when this value is nil | Cell: :x: - Button: :white_check_mark: |
| normalBackgroundColor    | The default background color of the cell, defaults to `UIColor.whiteColor()`                                        | Cell: :x: - Button: :white_check_mark: |

#### DezignableHiddenNavigationBar

| Property            | Description                                                          | Preview |
|---------------------|----------------------------------------------------------------------|---------|
| navigationBarHidden | Whether or not the navigation bar is hidden for this view controller | :x:     |

#### DezignableStatusBar

| Property        | Description                                                      | Preview |
|-----------------|------------------------------------------------------------------|---------|
| statusBarLight  | Shows a light status bar for this view controller                | :x:     |
| statusBarHidden | Whether or not the status bar is hidden for this view controller | :x:     |

## License

Dezignables is available under the MIT license. See the LICENSE file for more info.
