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
@property (weak, nonatomic) IBOutlet UISwitch *animatedSwitch;

@end

@implementation MBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)animate:(UIButton *)sender {
    if(self.animatedSwitch.on){
        [self.progressBar setValue:100.f - self.progressBar.value
                          animateWithDuration:1];
    }else{
        self.progressBar.value = 100.f - self.progressBar.value;
    }
}


@end
