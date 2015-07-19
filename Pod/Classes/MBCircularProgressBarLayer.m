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
@dynamic percent;
@dynamic lineWidth;
@dynamic progressColor;

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
    CGMutablePathRef arc = CGPathCreateMutable();
    
    CGPathAddArc(arc, NULL,
                 rectSize.width/2, rectSize.height/2,
                 MIN(rectSize.width,rectSize.height)/2 - self.lineWidth,
                 0.25*M_PI,
                 -1.25*M_PI + self.percent*1.5*M_PI,
                 YES);
    

    CGPathRef strokedArc =
    CGPathCreateCopyByStrokingPath(arc, NULL,
                                   1.f,
                                   kCGLineCapButt,
                                   kCGLineJoinMiter,
                                   10);
    
    
    CGContextAddPath(c, strokedArc);
    CGContextSetStrokeColorWithColor(c, [UIColor lightGrayColor].CGColor);
    CGContextDrawPath(c, kCGPathFillStroke);
}

- (void)drawProgressBar:(CGSize)rectSize context:(CGContextRef)c{
    CGMutablePathRef arc = CGPathCreateMutable();
    
    CGPathAddArc(arc, NULL,
                 rectSize.width/2, rectSize.height/2,
                 MIN(rectSize.width,rectSize.height)/2 - self.lineWidth,
                 -1.25*M_PI + self.percent*1.5*M_PI,
                 0.75*M_PI,
                 YES);
    
    CGPathRef strokedArc =
    CGPathCreateCopyByStrokingPath(arc, NULL,
                                   self.lineWidth,
                                   kCGLineCapRound,
                                   kCGLineJoinMiter,
                                   10);

    
    CGContextAddPath(c, strokedArc);
    CGContextSetFillColorWithColor(c, self.progressColor.CGColor);
    CGContextSetStrokeColorWithColor(c, self.progressColor.CGColor);
    CGContextDrawPath(c, kCGPathFillStroke);
}

- (void)drawText:(CGSize)rectSize context:(CGContextRef)c
{
    NSMutableParagraphStyle* textStyle = NSMutableParagraphStyle.defaultParagraphStyle.mutableCopy;
    textStyle.alignment = NSTextAlignmentLeft;
    
    NSDictionary* percentFontAttributes = @{NSFontAttributeName: [UIFont fontWithName: @"HelveticaNeue-Thin" size:rectSize.height/5], NSForegroundColorAttributeName: UIColor.blackColor, NSParagraphStyleAttributeName: textStyle};
    
    NSString* percentText = [NSString stringWithFormat:@"%.f%%",self.percent*100];
    
    CGSize percentSize = [percentText sizeWithAttributes:percentFontAttributes];
  
    [percentText drawAtPoint:CGPointMake(rectSize.width/2-percentSize.width/2,
                                         rectSize.height/2-percentSize.height/2)
              withAttributes:percentFontAttributes];
    
}

#pragma mark - Override methods to support animations

+ (BOOL)needsDisplayForKey:(NSString *)key {
    if ([key isEqualToString:@"percent"]) {
        return YES;
    }
    return [super needsDisplayForKey:key];
}

- (id<CAAction>)actionForKey:(NSString *)event{
    if ([self presentationLayer] != nil) {
        if ([event isEqualToString:@"percent"]) {
            CABasicAnimation *anim = [CABasicAnimation
                                      animationWithKeyPath:@"percent"];
            anim.fromValue = [[self presentationLayer]
                              valueForKey:@"percent"];
            anim.duration = [[CATransaction valueForKey:@"animationDuration"] floatValue];
            return anim;
        }
    }
    
    return [super actionForKey:event];
}


@end
