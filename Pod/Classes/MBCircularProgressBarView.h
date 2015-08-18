//
//  MBCircularProgressBarView.h
//  MBCircularProgressBar
//
//  Created by Mati Bot on 7/2/15.
//  Copyright (c) 2015 Mati Bot All rights reserved.
//

@import UIKit;

IB_DESIGNABLE
@interface MBCircularProgressBarView : UIView

@property (nonatomic,assign) IBInspectable CGFloat value;
@property (nonatomic,assign) IBInspectable CGFloat maxValue;

@property (nonatomic,assign) IBInspectable CGFloat valueFontSize;
@property (nonatomic,assign) IBInspectable CGFloat unitFontSize;
@property (nonatomic,copy) IBInspectable NSString* unitString;
@property (nonatomic,strong) IBInspectable UIColor* fontColor;

@property (nonatomic,assign) IBInspectable CGFloat progressRotationAngle;
@property (nonatomic,assign) IBInspectable CGFloat progressAngle;

@property (nonatomic,assign) IBInspectable CGFloat progressLineWidth;
@property (nonatomic,strong) IBInspectable UIColor* progressColor;
@property (nonatomic,strong) IBInspectable UIColor* progressStrokeColor;
//CGLineCap
@property (nonatomic,assign) IBInspectable NSInteger progressCapType;

@property (nonatomic,assign) IBInspectable CGFloat emptyLineWidth;
@property (nonatomic,strong) IBInspectable UIColor* emptyLineColor;
//CGLineCap
@property (nonatomic,assign) IBInspectable NSInteger emptyCapType;

@end
