//
//  MBCircularProgressBarView.m
//  MBCircularProgressBar
//
//  Created by Mati Bot on 7/2/15.
//  Copyright (c) 2015 Mati Bot All rights reserved.
//

#import "MBCircularProgressBarView.h"
#import "MBCircularProgressBarLayer.h"

@implementation MBCircularProgressBarView

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        //Without setting the content scale factor the layer would be pixelated
        [self setContentScaleFactor:[[UIScreen mainScreen] scale]];
    }
    return self;
}

#pragma mark - Getters and Setters for layer properties

-(void)setPercent:(CGFloat)percent{
    self.progressLayer.percent = percent;
}

-(CGFloat)percent{
    return self.progressLayer.percent;
}

-(void)setLineWidth:(CGFloat)percent{
    self.progressLayer.lineWidth = percent;
}

-(CGFloat)lineWidth{
    return self.progressLayer.lineWidth;
}

-(void)setProgressColor:(UIColor*)color{
    self.progressLayer.progressColor = color;
}

-(UIColor*)progressColor{
    return self.progressLayer.progressColor;
}

#pragma mark - CALayer

-(MBCircularProgressBarLayer*)progressLayer{
    MBCircularProgressBarLayer* layer = (MBCircularProgressBarLayer*) self.layer;
    return layer;
}

+ (Class) layerClass
{
    return [MBCircularProgressBarLayer class];
}

@end
