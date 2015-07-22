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

-(void)setProgressLineWidth:(CGFloat)width{
    self.progressLayer.progressLineWidth = width;
}

-(CGFloat)progressLineWidth{
    return self.progressLayer.progressLineWidth;
}

-(void)setEmptyLineWidth:(CGFloat)width{
    self.progressLayer.emptyLineWidth = width;
}

-(CGFloat)emptyLineWidth{
    return self.progressLayer.emptyLineWidth;
}

-(void)setProgressColor:(UIColor*)color{
    self.progressLayer.progressColor = color;
}

-(UIColor*)progressColor{
    return self.progressLayer.progressColor;
}

-(void)setFontColor:(UIColor*)color{
    self.progressLayer.fontColor = color;
}

-(UIColor*)fontColor{
    return self.progressLayer.fontColor;
}

-(void)setProgressStrokeColor:(UIColor*)color{
    self.progressLayer.progressStrokeColor = color;
}

-(UIColor*)progressStrokeColor{
    return self.progressLayer.progressStrokeColor;
}

-(void)setEmptyLineColor:(UIColor *)emptyLineColor{
    self.progressLayer.emptyLineColor = emptyLineColor;
}

-(UIColor*)emptyLineColor{
    return self.progressLayer.emptyLineColor;
}

-(void)setProgressAngle:(CGFloat)progressAngle{
    self.progressLayer.progressAngle = progressAngle;
}

-(CGFloat)progressAngle{
    return self.progressLayer.percent;
}

-(void)setProgressRotationAngle:(CGFloat)progressRootationAngle{
    self.progressLayer.progressRotationAngle = progressRootationAngle;
}

-(CGFloat)progressRootationAngle{
    return self.progressLayer.progressRotationAngle;
}

-(void)setProgressCapType:(NSInteger)progressCapType{
    self.progressLayer.progressCapType = [self safeCapType:progressCapType];
}

-(NSInteger)progressCapType{
    return self.progressLayer.progressCapType;
}

-(void)setEmptyCapType:(NSInteger)emptyCapType{
    self.progressLayer.emptyCapType = [self safeCapType:emptyCapType];
}

-(NSInteger)EmptyCapType{
    return self.progressLayer.emptyCapType;
}

-(CGLineCap)safeCapType:(NSInteger)type{
    if(0 <= type && type <= 2){
        return (CGLineCap)type;
    }
    
    return kCGLineCapRound;
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
