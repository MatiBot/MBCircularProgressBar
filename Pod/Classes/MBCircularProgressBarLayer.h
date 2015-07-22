//
//  MBCircularProgressBarLayer.h
//  MBCircularProgressBar
//
//  Created by Mati Bot on 7/9/15.
//  Copyright (c) 2015 Mati Bot All rights reserved.
//

@import QuartzCore;

@interface MBCircularProgressBarLayer : CALayer

@property (nonatomic,assign) CGFloat progressAngle;
@property (nonatomic,assign) CGFloat percent;

@property (nonatomic,assign) CGFloat progressLineWidth;
@property (nonatomic,strong) UIColor* progressColor;
@property (nonatomic,assign) NSUInteger progressCapType;

@property (nonatomic,assign) CGFloat emptyLineWidth;
@property (nonatomic,assign) NSUInteger emptyCapType;
@property (nonatomic,strong) UIColor* emptyLineColor;

@end
