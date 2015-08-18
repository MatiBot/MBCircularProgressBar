# MBCircularProgressBar

[![Version](https://img.shields.io/cocoapods/v/MBCircularProgressBar.svg?style=flat)](http://cocoapods.org/pods/MBCircularProgressBar)
[![License](https://img.shields.io/cocoapods/l/MBCircularProgressBar.svg?style=flat)](http://cocoapods.org/pods/MBCircularProgressBar)
[![Platform](https://img.shields.io/cocoapods/p/MBCircularProgressBar.svg?style=flat)](http://cocoapods.org/pods/MBCircularProgressBar)

![](https://raw.github.com/matibot/MBCircularProgressBar/0.2/Readme/example.png)
![](https://raw.github.com/matibot/MBCircularProgressBar/0.2/Readme/MBCircularProgressBar.gif)

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

MBCircularProgressBar is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "MBCircularProgressBar"
```

## Properties

Property name | Property type | Description | Range
------------ | ------------- | ------------- | -------------
value | CGFloat | The value to be displayed in the center | [0,maxValue]
maxValue | CGFloat | The maximum possible value, used to calculate the progress (value/maxValue)  | [0,∞)
valueFontSize | CGFloat | The font size of the value text  | [0,∞)
unitFontSize | CGFloat | The font size of the unit text | [0,∞)
unitString | NSString | The string that represents the units, usually % | 
fontColor | UIColor | The color of the value and unit text | 
progressRotationAngle | CGFloat | Progress bar rotation (Clockewise)| [0,100]
progressAngle | CGFloat | Set a partial angle for the progress bar | [0,100]
progressLineWidth | CGFloat | The width of the progress bar (user space units)  | [0,∞)
progressColor | UIColor | The color of the progress bar | 
progressStrokeColor | UIColor | The color of the progress bar frame  | 
progressCapType | NSInteger | The shape of the progress bar cap | {kCGLineCapButt=0, kCGLineCapRound=1, kCGLineCapSquare=2}
emptyLineWidth | CGFloat | The width of the background bar (user space units) | [0,∞)
emptyLineColor | CGFloat | The color of the background bar | 
emptyCapType | CGFloat | The shape of the background bar cap | {kCGLineCapButt=0, kCGLineCapRound=1, kCGLineCapSquare=2}

## Animation

In order to animate a change in the progress bar you just need to change the `value` property

```objc
self.progressBar.value = 55.f;
```

In case you want to change the duration of the animation, you would need to set a `CATransaction`

```objc
[CATransaction begin];
[CATransaction setAnimationDuration:5];
    
self.progressBar.value = 55.f;
    
[CATransaction commit];
```

## References

[[iOS][Swift] MBCircularProgressBar で円形のプログレスバーを実現](http://dev.classmethod.jp/smartphone/mbcircularprogressbar/)  by [@cocominap](https://twitter.com/cocominap) (in Japanese)

## Author

Mati Bot, matibot@gmail.com, [@b0tnik](https://twitter.com/b0tnik)

## License

MBCircularProgressBar is available under the MIT license. See the LICENSE file for more info.

