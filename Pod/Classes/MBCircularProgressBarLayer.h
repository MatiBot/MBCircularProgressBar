//
//  MBCircularProgressBarLayer.h
//  MBCircularProgressBar
//
//  Created by Mati Bot on 7/9/15.
//  Copyright (c) 2015 Mati Bot All rights reserved.
//

@import QuartzCore;

@interface MBCircularProgressBarLayer : CALayer

@property (nonatomic,assign) CGFloat  progressAngle;
@property (nonatomic,assign) CGFloat  progressRotationAngle;
@property (nonatomic,assign) CGFloat  value;
@property (nonatomic,assign) CGFloat  maxValue;
@property (nonatomic,assign) NSTimeInterval  animationDuration;
@property (nonatomic,assign) BOOL  animated;
@property (nonatomic,assign) CGFloat  valueFontSize;
@property (nonatomic,assign) CGFloat  unitFontSize;
@property (nonatomic,copy)   NSString *unitString;
@property (nonatomic,strong) UIColor  *fontColor;

@property (nonatomic,assign) CGFloat    progressLineWidth;
@property (nonatomic,strong) UIColor    *progressColor;
@property (nonatomic,strong) UIColor    *progressStrokeColor;
@property (nonatomic,assign) CGLineCap  progressCapType;

@property (nonatomic,assign) CGFloat    emptyLineWidth;
@property (nonatomic,assign) CGLineCap  emptyCapType;
@property (nonatomic,strong) UIColor    *emptyLineColor;

@property (nonatomic,assign)  NSInteger decimalPlaces;
@property (nonatomic,assign)  CGFloat   valueDecimalFontSize;
@property (nonatomic,copy)    NSString  *unitFontName;
@property (nonatomic,copy)    NSString  *valueFontName;
@property (nonatomic,assign)  BOOL      showUnitString;
@property (nonatomic,assign)  BOOL      showValueString;

@end
