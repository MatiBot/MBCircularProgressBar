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
@dynamic borderPadding;
@dynamic valueFontSize;
@dynamic unitString;
@dynamic unitFontSize;
@dynamic progressLineWidth;
@dynamic progressColor;
@dynamic progressStrokeColor;
@dynamic emptyLineWidth;
@dynamic progressAngle;
@dynamic emptyLineColor;
@dynamic emptyLineStrokeColor;
@dynamic emptyCapType;
@dynamic progressCapType;
@dynamic fontColor;
@dynamic progressRotationAngle;
@dynamic progressAppearanceType;
@dynamic decimalPlaces;
@dynamic valueDecimalFontSize;
@dynamic unitFont;
@dynamic valueFont;
@dynamic showUnitString;
@dynamic showValueString;
@dynamic textOffset;
@dynamic countdown;
@dynamic counterclockwise;

#pragma mark - Drawing

//-(void)setValue:(CGFloat)value{
//    [self drawProgressBar:<#(CGSize)#> context:<#(CGContextRef)#>]
//}

- (void) drawInContext:(CGContextRef) context{
    [super drawInContext:context];

    UIGraphicsPushContext(context);
    
    CGRect rect = CGContextGetClipBoundingBox(context);
    rect = CGRectIntegral(CGRectInset(rect, self.borderPadding, self.borderPadding));
    
    [self drawEmptyBar:rect context:context];
    [self drawProgressBar:rect context:context];
  
    if (self.showValueString){
      [self drawText:rect.size context:context];
    }
    
    UIGraphicsPopContext();
}

- (void)drawEmptyBar:(CGRect)rect context:(CGContextRef)c{
    
    if(self.emptyLineWidth <= 0){
        return;
    }
    
    CGPoint center = {CGRectGetMidX(rect), CGRectGetMidY(rect)};
    CGFloat radius = MIN(CGRectGetWidth(rect), CGRectGetHeight(rect))/2;
    if (self.progressAppearanceType == MBCircularProgressBarAppearanceTypeOverlaysEmptyLine) {
        radius = radius - MAX(self.emptyLineWidth, self.progressLineWidth)/2.f;
    } else if (self.progressAppearanceType == MBCircularProgressBarAppearanceTypeAboveEmptyLine) {
        radius = radius - self.progressLineWidth - self.emptyLineWidth/2.f;
    } else {
        radius = radius - self.emptyLineWidth/2.f;
    }
    
    CGMutablePathRef arc = CGPathCreateMutable();
    CGPathAddArc(arc, NULL,
                 center.x, center.y, radius,
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
    CGContextSetStrokeColorWithColor(c, self.emptyLineStrokeColor.CGColor);
    CGContextSetFillColorWithColor(c, self.emptyLineColor.CGColor);
    CGContextDrawPath(c, kCGPathFillStroke);
    
    CGPathRelease(arc);
    CGPathRelease(strokedArc);
}

- (void)drawProgressBar:(CGRect)rect context:(CGContextRef)c{
    if(self.progressLineWidth <= 0){
        return;
    }
    
    CGPoint center = {CGRectGetMidX(rect), CGRectGetMidY(rect)};
    CGFloat radius = MIN(CGRectGetWidth(rect), CGRectGetHeight(rect))/2;
    if (self.progressAppearanceType == MBCircularProgressBarAppearanceTypeOverlaysEmptyLine) {
        radius = radius - MAX(self.emptyLineWidth, self.progressLineWidth)/2.f;
    } else if (self.progressAppearanceType == MBCircularProgressBarAppearanceTypeAboveEmptyLine) {
        radius = radius - self.progressLineWidth/2.f;
    } else {
        radius = radius - self.emptyLineWidth - self.progressLineWidth/2.f;
    }
    
    CGMutablePathRef arc = CGPathCreateMutable();
    
    BOOL clockwise = !self.counterclockwise;
    CGFloat rotation = ((-self.progressRotationAngle/100.f)*2.f+0.5)*M_PI;
    CGFloat startAngle = (self.progressAngle/100.f)*M_PI - rotation;
    CGFloat endAngle = -(self.progressAngle/100.f)*M_PI - rotation;
    CGFloat valueAngle = (2.f*M_PI)*(self.progressAngle/100.f)*(100.f-100.f*self.value/self.maxValue)/100.f;
    
    if (clockwise)
    {
        CGPathAddArc(arc, NULL,
                     center.x, center.y, radius,
                     startAngle - valueAngle,
                     endAngle,
                     YES);
    } else {
        CGPathAddArc(arc, NULL,
                     center.x, center.y, radius,
                     endAngle + valueAngle,
                     startAngle,
                     NO);
    }
    
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
    NSMutableParagraphStyle* textStyle = NSMutableParagraphStyle.new;
    textStyle.alignment = NSTextAlignmentCenter;
    
    CGFloat valueFontSize = self.valueFontSize == -1 ? rectSize.height/5 : self.valueFontSize;
    
    NSDictionary* valueFontAttributes = @{NSFontAttributeName: [self.valueFont fontWithSize:valueFontSize], NSForegroundColorAttributeName: self.fontColor, NSParagraphStyleAttributeName: textStyle};
    
    NSMutableAttributedString *text = [NSMutableAttributedString new];
    
    NSString *formatString = [NSString stringWithFormat:@"%%.%df", (int)self.decimalPlaces];
    
    NSString* textToPresent;
    if (self.countdown) {
        textToPresent = [NSString stringWithFormat:formatString, (self.maxValue - self.value)];
    } else {
        textToPresent = [NSString stringWithFormat:formatString, self.value];
    }
    NSAttributedString* value = [[NSAttributedString alloc] initWithString:textToPresent
                                                                attributes:valueFontAttributes];
    [text appendAttributedString:value];
    
    // set the decimal font size
    NSUInteger decimalLocation = [text.string rangeOfString:@"."].location;
    if (decimalLocation != NSNotFound){
        NSDictionary* valueDecimalFontAttributes = @{NSFontAttributeName: [self.valueFont fontWithSize:self.valueDecimalFontSize == -1 ? valueFontSize : self.valueDecimalFontSize], NSForegroundColorAttributeName: self.fontColor, NSParagraphStyleAttributeName: textStyle};
        NSRange decimalRange = NSMakeRange(decimalLocation, text.length - decimalLocation);
        [text setAttributes:valueDecimalFontAttributes range:decimalRange];
    }
    
    // ad the unit only if specified
    if (self.showUnitString) {
        NSDictionary* unitFontAttributes = @{NSFontAttributeName: [self.unitFont fontWithSize:self.unitFontSize == -1 ? rectSize.height/7 : self.unitFontSize], NSForegroundColorAttributeName: self.fontColor, NSParagraphStyleAttributeName: textStyle};
        
        NSAttributedString* unit =
        [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"\n%@", self.unitString] attributes:unitFontAttributes];
        [text appendAttributedString:unit];
    }
    
    CGSize percentSize = [text size];
    CGPoint textCenter = CGPointMake(
                                     rectSize.width/2-percentSize.width/2 + self.textOffset.x,
                                     rectSize.height/2-percentSize.height/2 + self.textOffset.y
                                     );
    
    CGRect rect = { textCenter, percentSize };
    
    [text drawInRect:rect];
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
            id animation = [super actionForKey:@"backgroundColor"];
            
            if (animation == nil || [animation isEqual:[NSNull null]])
            {
                [self setNeedsDisplay];
                return [NSNull null];
            }
            [animation setKeyPath:event];
            [animation setFromValue:[self.presentationLayer valueForKey:@"value"]];
            [animation setToValue:nil];
            return animation;
        }
    }
    
    return [super actionForKey:event];
}

@end
