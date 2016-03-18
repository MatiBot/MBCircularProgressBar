//
//  MBCircularProgressBarLayer.h
//  MBCircularProgressBar
//
//  Created by Mati Bot on 7/9/15.
//  Copyright (c) 2015 Mati Bot All rights reserved.
//

@import QuartzCore;

/**
 * The MBCircularProgressBarLayer class is a CALayer subclass that represents the underlying layer
 * of MBCircularProgressBarView.
 */
@interface MBCircularProgressBarLayer : CALayer

/**
 * Set a partial angle for the progress bar	[0,100]
 */
@property (nonatomic,assign)            CGFloat     progressAngle;

/**
 * Progress bar rotation (Clockewise)	[0,100]
 */
@property (nonatomic,assign)            CGFloat     progressRotationAngle;

/**
 * The value of the progress bar
 */
@property (nonatomic,assign)            CGFloat     value;

/**
 * The maximum possible value, used to calculate the progress (value/maxValue)	[0,∞)
 */
@property (nonatomic,assign)            CGFloat     maxValue;

/**
 * Animation duration in seconds
 */
@property (nonatomic,assign)            NSTimeInterval  animationDuration;

/**
 * Defines if the progress should animate on value change
 */
@property (nonatomic,assign)            BOOL        animated;

/**
 * The font size of the value text	[0,∞)
 */
@property (nonatomic,assign)            CGFloat     valueFontSize;

/**
 * The name of the font of the unit string
 */
@property (nonatomic,assign)            CGFloat     unitFontSize;

/**
 * The string that represents the units, usually %
 */
@property (nonatomic,copy,nullable)     NSString    *unitString;

/**
 * The color of the value and unit text
 */
@property (nonatomic,strong,nullable)   UIColor     *fontColor;

/**
 * The width of the progress bar (user space units)	[0,∞)
 */
@property (nonatomic,assign)            CGFloat     progressLineWidth;

/**
 * The color of the progress bar
 */
@property (nonatomic,strong,nullable)   UIColor     *progressColor;

/**
 * The color of the progress bar frame
 */
@property (nonatomic,strong,nullable)   UIColor     *progressStrokeColor;

/**
 * The shape of the progress bar cap	{kCGLineCapButt=0, kCGLineCapRound=1, kCGLineCapSquare=2}
 */
@property (nonatomic,assign)            CGLineCap   progressCapType;

/**
 * The width of the background bar (user space units)	[0,∞)
 */
@property (nonatomic,assign)            CGFloat     emptyLineWidth;

/**
 * The shape of the background bar cap	{kCGLineCapButt=0, kCGLineCapRound=1, kCGLineCapSquare=2}
 */
@property (nonatomic,assign)            CGLineCap   emptyCapType;

/**
 * The color of the background bar
 */
@property (nonatomic,strong,nullable)   UIColor     *emptyLineColor;

/*
 * Number of decimal places of the value [0,∞)
 */
@property (nonatomic,assign)            NSInteger   decimalPlaces;

/**
 * The value to be displayed in the center
 */
@property (nonatomic,assign)            CGFloat     valueDecimalFontSize;

/**
 * The font size of the unit text	[0,∞)
 */
@property (nonatomic,copy,nullable)     NSString    *unitFontName;

/**
 * The name of the font of the unit string
 */
@property (nonatomic,copy,nullable)     NSString    *valueFontName;

/**
 * Should show unit screen
 */
@property (nonatomic,assign)            BOOL        showUnitString;

/**
 * The offset to apply to the unit / value text
 */
@property (nonatomic,assign)            CGPoint     textOffset;

/**
 * Should show value string
 */
@property (nonatomic,assign)            BOOL      showValueString;

@end
