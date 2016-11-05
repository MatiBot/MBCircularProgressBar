//
//  MBCircularProgressBarView.h
//  MBCircularProgressBar
//
//  Created by Mati Bot on 7/2/15.
//  Copyright (c) 2015 Mati Bot All rights reserved.
//

@import UIKit;

IB_DESIGNABLE
/**
 * The MBCircularProgressBarView class is a UIView subclass that draws a circular progress bar with configurable attributes.
 * You can change the attributes within the Interface Builder using IBDesignables (https://developer.apple.com/library/ios/recipes/xcode_help-IB_objects_media/Chapters/CreatingaLiveViewofaCustomObject.html )
 */
@interface MBCircularProgressBarView : UIView

/**
 * Should show value string 
 */
@property (nonatomic,assign) IBInspectable BOOL      showValueString;

/**
 * The value of the progress bar (Animatable property using [UIView animateWithDuration:]) 
 */
@property (nonatomic,assign) IBInspectable CGFloat   value;

/** 
 * The maximum possible value, used to calculate the progress (value/maxValue)	[0,∞) 
 */
@property (nonatomic,assign) IBInspectable CGFloat   maxValue;

/* 
 * Number of decimal places of the value [0,∞) 
 */
@property (nonatomic,assign) IBInspectable NSInteger decimalPlaces;

/** 
 * The name of the font of the value string
 */
@property (nonatomic,copy)   IBInspectable NSString  *valueFontName;

/**
 * The font size of the value text	[0,∞) 
 */
@property (nonatomic,assign) IBInspectable CGFloat   valueFontSize;

/** 
 * The value to be displayed in the center 
 */
@property (nonatomic,assign) IBInspectable CGFloat   valueDecimalFontSize;

/**
 * Should show unit screen 
 */
@property (nonatomic,assign) IBInspectable BOOL      showUnitString;

/**
 * The name of the font of the unit string 
 */
@property (nonatomic,copy)   IBInspectable NSString  *unitFontName;

/**
 * The font size of the unit text	[0,∞) 
 */
@property (nonatomic,assign) IBInspectable CGFloat   unitFontSize;

/** 
 * The string that represents the units, usually % 
 */
@property (nonatomic,copy)   IBInspectable NSString  *unitString;

/** 
 * The color of the value and unit text 
 */
@property (nonatomic,strong) IBInspectable UIColor   *fontColor;

/**
 * Progress bar rotation (Clockewise)	[0,100] 
 */
@property (nonatomic,assign) IBInspectable CGFloat   progressRotationAngle;

/** 
 * Set a partial angle for the progress bar	[0,100] 
 */
@property (nonatomic,assign) IBInspectable CGFloat   progressAngle;

/** 
 * The width of the progress bar (user space units)	[0,∞)
 */
@property (nonatomic,assign) IBInspectable CGFloat   progressLineWidth;

/** 
 * The color of the progress bar 
 */
@property (nonatomic,strong) IBInspectable UIColor   *progressColor;

/**
 * The color of the progress bar frame 
 */
@property (nonatomic,strong) IBInspectable UIColor   *progressStrokeColor;

/**
 * The shape of the progress bar cap	{kCGLineCapButt=0, kCGLineCapRound=1, kCGLineCapSquare=2} 
 */
@property (nonatomic,assign) IBInspectable NSInteger progressCapType;

/**
 * The width of the background bar (user space units)	[0,∞) 
 */
@property (nonatomic,assign) IBInspectable CGFloat   emptyLineWidth;

/**
 * The color of the background bar 
 */
@property (nonatomic,strong) IBInspectable UIColor   *emptyLineColor;

/**
 * The color of the background bar stroke color
 */
@property (nonatomic,strong) IBInspectable UIColor   *emptyLineStrokeColor;

/**
 * The shape of the background bar cap	{kCGLineCapButt=0, kCGLineCapRound=1, kCGLineCapSquare=2} 
 */
@property (nonatomic,assign) IBInspectable NSInteger emptyCapType;

/**
 * The offset to apply to the unit / value text
 */
@property (nonatomic,assign) IBInspectable CGPoint textOffset;


/**
 * The bool value to apply to if its counddown or not
 */
@property (nonatomic,assign) IBInspectable BOOL      countdown;

@end
