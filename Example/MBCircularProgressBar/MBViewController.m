//
//  MBViewController.m
//  MBCircularProgressBar
//
//  Created by Mati Bot on 07/19/2015.
//  Copyright (c) 2015 Mati Bot. All rights reserved.
//

#import "MBViewController.h"
#import <MBCircularProgressBar/MBCircularProgressBarView.h>

@interface MBViewController ()

@property (weak, nonatomic) IBOutlet MBCircularProgressBarView *progressBar;

@end

@implementation MBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)animate:(UIButton *)sender {
    [CATransaction begin];
    [CATransaction setAnimationDuration:1];
    
    self.progressBar.percent = 1.f - self.progressBar.percent;
    
    [CATransaction commit];
}
@end
