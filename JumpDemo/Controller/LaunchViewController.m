//
//  LaunchViewController.m
//  JumpViewDemo
//
//  Created by Chen Li on 2016/11/17.
//  Copyright © 2016年 Chen Li. All rights reserved.
//

#import "LaunchViewController.h"
#import "JumpViewController.h"

#define LAUNCH_STATIC_IMAGE_NAME                                    @"defaultLaunchImage"
#define LAUNCH_SPLASH_LOGO_IMAGE_NAME                               @"launchSplashLogoName"

@interface LaunchViewController ()

@end

@implementation LaunchViewController
@synthesize launchBackgroundImageView   = _launchBackgroundImageView;
@synthesize markImageView               = _markImageView;
@synthesize launchTimer                 = _launchTimer;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:[self launchBackgroundImageView]];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [UIView animateWithDuration:2.0
                     animations:^{
                         CGRect rect = _launchBackgroundImageView.frame;
                         rect.origin = CGPointMake(-80, -80);
                         rect.size   = CGSizeMake(rect.size.width + 160, rect.size.height + 160);
                         _launchBackgroundImageView.frame = rect;
                     }
                     completion:^(BOOL finished) {
//                         [JumpViewController createViewControllerWithIndex:0];
                     }
     ];
}

- (UIImageView *)launchBackgroundImageView
{
    if (!_launchBackgroundImageView)
    {
        _launchBackgroundImageView                  = [[UIImageView alloc] init];
        _launchBackgroundImageView.frame            = self.view.frame;
        _launchBackgroundImageView.backgroundColor  = [UIColor cyanColor];
        _launchBackgroundImageView.image            = [UIImage imageNamed:LAUNCH_STATIC_IMAGE_NAME];
    }
    return _launchBackgroundImageView;
}

- (UIImageView *)markImageView
{
    if (!_markImageView)
    {
        _markImageView                  = [[UIImageView alloc] init];
        _markImageView.image            = [UIImage imageNamed:LAUNCH_SPLASH_LOGO_IMAGE_NAME];
        _markImageView.backgroundColor  = [UIColor clearColor];
    }
    return _markImageView;
}



@end
