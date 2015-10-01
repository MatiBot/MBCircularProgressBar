[![Gitter](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/matibot/MBCircularProgressBar?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge)
[![Version](https://img.shields.io/cocoapods/v/MBCircularProgressBar.svg?style=flat)](http://cocoapods.org/pods/MBCircularProgressBar)
[![License](https://img.shields.io/cocoapods/l/MBCircularProgressBar.svg?style=flat)](http://cocoapods.org/pods/MBCircularProgressBar)
[![Platform](https://img.shields.io/cocoapods/p/MBCircularProgressBar.svg?style=flat)](http://cocoapods.org/pods/MBCircularProgressBar)
[![Analytics](https://ga-beacon.appspot.com/UA-66922648-1/matibot/MBCircularProgressBar?pixel)](https://github.com/matibot/MBCircularProgressBar)

If you use MBCircularProgressBar, please tell me and I will add your app here.


![](https://raw.github.com/matibot/MBCircularProgressBar/0.2/Readme/example.png)
![](https://raw.github.com/matibot/MBCircularProgressBar/0.2/Readme/MBCircularProgressBar.gif)

## Usage

To run the example project, clone the repo, and run `pod update` from the Example directory first.

## Installation

### Cocoapods

MBCircularProgressBar is available through [CocoaPods](http://cocoapods.org).

To install it, simply add the following lines to your Podfile:

Add this line to the begining of your Podfile in order to support @IBDesignable. More info [here](http://blog.cocoapods.org/CocoaPods-0.36/) (Thanks to: [@StevenMasini](https://github.com/StevenMasini))

```ruby
use_frameworks!
```

And add this line so with every Pod install/update cocoapods would download the library intro your project:

```ruby
pod "MBCircularProgressBar"
```

### Directly

You can also download the MBCircularProgressBar{View,Layer}.{m,h} files into your project directly


## Properties

Property name | Property type | Description | Range
------------ | ------------- | ------------- | -------------
value | CGFloat | The value to be displayed in the center | [0,maxValue]
maxValue | CGFloat | The maximum possible value, used to calculate the progress (value/maxValue)  | [0,∞)
showValueString | BOOL | Should show value string |
showUnitString | BOOL | Should show unit string |
valueFontName | NSString | The name of the font of the value string | Any valid font name
valueFontSize | CGFloat | The font size of the value text  | [0,∞)
valueFontName | NSString | The name of the font of the unit string | Any valid font name
unitFontSize | CGFloat | The font size of the unit text | [0,∞)
unitString | NSString | The string that represents the units, usually % |
fontColor | UIColor | The color of the value and unit text |
decimalPlaces | NSInteger | Number of decimal places of the value | [0,∞)
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

In order to animate a change in the progress bar you should use the `setValue:animateWithDuration:` method

```objc
[self.progressBar setValue:55.f animateWithDuration:1];
```

## References

[[iOS][Swift] MBCircularProgressBar で円形のプログレスバーを実現](http://dev.classmethod.jp/smartphone/mbcircularprogressbar/)  by [@cocominap](https://twitter.com/cocominap) (in Japanese)

## Author

Mati Bot, matibot@gmail.com, [@b0tnik](https://twitter.com/b0tnik)

## License

MBCircularProgressBar is available under the MIT license. See the LICENSE file for more info.
