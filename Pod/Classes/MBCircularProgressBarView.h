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

@property (nonatomic) IBInspectable CGFloat progressAngle;
@property (nonatomic) IBInspectable CGFloat percent;

@property (nonatomic) IBInspectable CGFloat progressLineWidth;
@property (nonatomic) IBInspectable UIColor* progressColor;
@property (nonatomic) IBInspectable NSUInteger progressCapType;

@property (nonatomic) IBInspectable CGFloat emptyLineWidth;
@property (nonatomic) IBInspectable UIColor* emptyLineColor;
@property (nonatomic) IBInspectable NSUInteger emptyCapType;
@end
