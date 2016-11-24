//
//  CurrentInformationViewController.m
//  JumpDemo
//
//  Created by Chen Li on 2016/11/24.
//  Copyright © 2016年 Chen Li. All rights reserved.
//

#import "CurrentInformationViewController.h"
#define COLOR_RGBA(r,g,b,a)             [UIColor colorWithRed:(r/255.0) green:(g/255.0) blue:(b/255.0) alpha:a]
#define COLOR_RGB(r,g,b)                [UIColor colorWithRed:(r/255.0) green:(g/255.0) blue:(b/255.0) alpha:1.0]
#define COLOR_RANDOM                    COLOR_RGBA(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256), 1.0)
#define COLOR_BACKGROUND_GRAY           COLOR_RGBA(240, 240, 240, 1.0)
#define COLOR_DIVIDERLIN                COLOR_RGBA(240, 240, 240, 1.0)

#define COLOR_RANDOM                    COLOR_RGBA(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256), 1.0)

@interface CurrentInformationViewController ()

@end

@implementation CurrentInformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:COLOR_RANDOM];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
