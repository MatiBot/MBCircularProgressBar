//
//  MBCircularProgressBarLayer.m
//  MBCircularProgressBar
//
//  Created by Mati Bot on 7/9/15.
//  Copyright (c) 2015 Mati Bot All rights reserved.
//

@import UIKit;
@import CoreGraphics;

#import "MBCircularProgressBarLayer.h"

@implementation MBCircularProgressBarLayer
@dynamic value;
@dynamic maxValue;
@dynamic valueFontSize;
@dynamic unitString;
@dynamic unitFontSize;
@dynamic progressLineWidth;
@dynamic progressColor;
@dynamic progressStrokeColor;
@dynamic emptyLineWidth;
@dynamic progressAngle;
@dynamic emptyLineColor;
@dynamic emptyCapType;
@dynamic progressCapType;
@dynamic fontColor;
@dynamic progressRotationAngle;

#pragma mark - Drawing

- (void) drawInContext:(CGContextRef) context{
    [super drawInContext:context];

    UIGraphicsPushContext(context);
    
    CGSize size = CGRectIntegral(CGContextGetClipBoundingBox(context)).size;
    [self drawEmptyBar:size context:context];
    [self drawProgressBar:size context:context];
    [self drawText:size context:context];
    
    UIGraphicsPopContext();
}

- (void)drawEmptyBar:(CGSize)rectSize context:(CGContextRef)c{
    
    if(self.emptyLineWidth <= 0){
        return;
    }
    
    CGMutablePathRef arc = CGPathCreateMutable();
    
    CGPathAddArc(arc, NULL,
                 rectSize.width/2, rectSize.height/2,
                 MIN(rectSize.width,rectSize.height)/2 - self.progressLineWidth,
                 (self.progressAngle/100.f)*M_PI-((-self.progressRotationAngle/100.f)*2.f+0.5)*M_PI,
                 -(self.progressAngle/100.f)*M_PI-((-self.progressRotationAngle/100.f)*2.f+0.5)*M_PI,
                 YES);
    

    CGPathRef strokedArc =
    CGPathCreateCopyByStrokingPath(arc, NULL,
                                   self.emptyLineWidth,
                                   (CGLineCap)self.emptyCapType,
                                   kCGLineJoinMiter,
                                   10);
    
    
    CGContextAddPath(c, strokedArc);
    CGContextSetStrokeColorWithColor(c, self.emptyLineColor.CGColor);
    CGContextSetFillColorWithColor(c, self.emptyLineColor.CGColor);
    CGContextDrawPath(c, kCGPathFillStroke);
}

- (void)drawProgressBar:(CGSize)rectSize context:(CGContextRef)c{
    if(self.progressLineWidth <= 0){
        return;
    }
    
    CGMutablePathRef arc = CGPathCreateMutable();
    
    CGPathAddArc(arc, NULL,
                 rectSize.width/2, rectSize.height/2,
                 MIN(rectSize.width,rectSize.height)/2 - self.progressLineWidth,
                 (self.progressAngle/100.f)*M_PI-((-self.progressRotationAngle/100.f)*2.f+0.5)*M_PI-(2.f*M_PI)*(self.progressAngle/100.f)*(100.f-100.f*self.value/self.maxValue)/100.f,
                 -(self.progressAngle/100.f)*M_PI-((-self.progressRotationAngle/100.f)*2.f+0.5)*M_PI,
                 YES);
    
    CGPathRef strokedArc =
    CGPathCreateCopyByStrokingPath(arc, NULL,
                                   self.progressLineWidth,
                                   (CGLineCap)self.progressCapType,
                                   kCGLineJoinMiter,
                                   10);

    
    CGContextAddPath(c, strokedArc);
    CGContextSetFillColorWithColor(c, self.progressColor.CGColor);
    CGContextSetStrokeColorWithColor(c, self.progressStrokeColor.CGColor);
    CGContextDrawPath(c, kCGPathFillStroke);
}

- (void)drawText:(CGSize)rectSize context:(CGContextRef)c
{
    NSMutableParagraphStyle* textStyle = NSMutableParagraphStyle.defaultParagraphStyle.mutableCopy;
    textStyle.alignment = NSTextAlignmentLeft;
    
    NSDictionary* valueFontAttributes = @{NSFontAttributeName: [UIFont fontWithName: @"HelveticaNeue-Thin" size:self.valueFontSize == -1 ? rectSize.height/5 : self.valueFontSize], NSForegroundColorAttributeName: self.fontColor, NSParagraphStyleAttributeName: textStyle};
    
    NSDictionary* unitFontAttributes = @{NSFontAttributeName: [UIFont fontWithName: @"HelveticaNeue-Thin" size:self.unitFontSize == -1 ? rectSize.height/7 : self.unitFontSize], NSForegroundColorAttributeName: self.fontColor, NSParagraphStyleAttributeName: textStyle};
    
    NSMutableAttributedString* text = [NSMutableAttributedString new];
    
    NSAttributedString* value =
    [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%.f", self.value] attributes:valueFontAttributes];
    
    NSAttributedString* unit =
    [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@", self.unitString] attributes:unitFontAttributes];
    
    [text appendAttributedString:value];
    [text appendAttributedString:unit];
    
    CGSize percentSize = [text size];
  
    [text drawAtPoint:CGPointMake(rectSize.width/2-percentSize.width/2,
                                         rectSize.height/2-percentSize.height/2)];
    
}

#pragma mark - Override methods to support animations

+ (BOOL)needsDisplayForKey:(NSString *)key {
    if ([key isEqualToString:@"value"]) {
        return YES;
    }
    return [super needsDisplayForKey:key];
}

- (id<CAAction>)actionForKey:(NSString *)event{
    if ([self presentationLayer] != nil) {
        if ([event isEqualToString:@"value"]) {
            CABasicAnimation *anim = [CABasicAnimation
                                      animationWithKeyPath:@"value"];
            anim.fromValue = [[self presentationLayer]
                              valueForKey:@"value"];
            anim.duration = [[CATransaction valueForKey:@"animationDuration"] floatValue];
            return anim;
        }
    }
    
    return [super actionForKey:event];
}


@end
