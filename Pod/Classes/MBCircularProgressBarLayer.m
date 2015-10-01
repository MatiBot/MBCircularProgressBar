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
@dynamic decimalPlaces;
@dynamic valueDecimalFontSize;
@dynamic unitFontName;
@dynamic valueFontName;
@dynamic showUnitString;
@dynamic showValueString;


#pragma mark - Drawing

- (void) drawInContext:(CGContextRef) context{
    [super drawInContext:context];

    UIGraphicsPushContext(context);
    
    CGSize size = CGRectIntegral(CGContextGetClipBoundingBox(context)).size;
    [self drawEmptyBar:size context:context];
    [self drawProgressBar:size context:context];
  
    if (self.showValueString){
      [self drawText:size context:context];
    }
    
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
    
    CGPathRelease(arc);
    CGPathRelease(strokedArc);
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
    
    CGPathRelease(arc);
    CGPathRelease(strokedArc);
}

- (void)drawText:(CGSize)rectSize context:(CGContextRef)c
{
  

  NSMutableParagraphStyle* textStyle = NSMutableParagraphStyle.defaultParagraphStyle.mutableCopy;
  textStyle.alignment = NSTextAlignmentLeft;
  
  CGFloat valueFontSize = self.valueFontSize == -1 ? rectSize.height/5 : self.valueFontSize;
  
  NSDictionary* valueFontAttributes = @{NSFontAttributeName: [UIFont fontWithName: self.valueFontName size:valueFontSize], NSForegroundColorAttributeName: self.fontColor, NSParagraphStyleAttributeName: textStyle};
  
  NSMutableAttributedString *text = [NSMutableAttributedString new];
  
  NSString *formatString = [NSString stringWithFormat:@"%%.%df", (int)self.decimalPlaces];
  NSAttributedString* value =
  [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:formatString, self.value] attributes:valueFontAttributes];
  
  [text appendAttributedString:value];
  
  // set the decimal font size
  NSUInteger decimalLocation = [text.string rangeOfString:@"."].location;
  if (decimalLocation != NSNotFound){
    NSDictionary* valueDecimalFontAttributes = @{NSFontAttributeName: [UIFont fontWithName: self.valueFontName size:self.valueDecimalFontSize == -1 ? valueFontSize : self.valueDecimalFontSize], NSForegroundColorAttributeName: self.fontColor, NSParagraphStyleAttributeName: textStyle};
    NSRange decimalRange = NSMakeRange(decimalLocation, text.length - decimalLocation);
    [text setAttributes:valueDecimalFontAttributes range:decimalRange];
  }
  
  // ad the unit only if specified
  if (self.showUnitString) {
    NSDictionary* unitFontAttributes = @{NSFontAttributeName: [UIFont fontWithName: self.unitFontName size:self.unitFontSize == -1 ? rectSize.height/7 : self.unitFontSize], NSForegroundColorAttributeName: self.fontColor, NSParagraphStyleAttributeName: textStyle};
    
    NSAttributedString* unit =
    [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@", self.unitString] attributes:unitFontAttributes];
    [text appendAttributedString:unit];
  }
  
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
        if ([event isEqualToString:@"value"] && self.animated) {
            CABasicAnimation *anim = [CABasicAnimation
                                      animationWithKeyPath:@"value"];
            anim.fromValue = [[self presentationLayer]
                              valueForKey:@"value"];
            anim.duration = self.animationDuration;
            return anim;
        }
    }
    
    return [super actionForKey:event];
}


@end
