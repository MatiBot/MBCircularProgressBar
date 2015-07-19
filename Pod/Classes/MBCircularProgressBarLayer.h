//
//  MBCircularProgressBarLayer.h
//  MBCircularProgressBar
//
//  Created by Mati Bot on 7/9/15.
//  Copyright (c) 2015 Mati Bot All rights reserved.
//

@import QuartzCore;

@interface MBCircularProgressBarLayer : CALayer

@property (nonatomic,assign) CGFloat percent;
@property (nonatomic,assign) CGFloat lineWidth;
@property (nonatomic) UIColor* progressColor;

@end
