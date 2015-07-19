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

@property (nonatomic) IBInspectable CGFloat percent;
@property (nonatomic) IBInspectable CGFloat lineWidth;
@property (nonatomic) IBInspectable UIColor* progressColor;

@end
