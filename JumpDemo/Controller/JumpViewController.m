//
//  JumpViewController.m
//  JumpViewDemo
//
//  Created by Chen Li on 2016/11/17.
//  Copyright © 2016年 Chen Li. All rights reserved.
//

#import "JumpViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "LeftViewController.h"
#import "RightViewController.h"

#import "BasicViewController.h"

#import "MMDrawerController.h"
#import "MMDrawerVisualState.h"

#import "Globe.h"

#import "MacroOfDefine_Const.h"

static JumpViewController *jumpVC = nil;

@interface JumpViewController ()

+ (JumpViewController *)sharedJumpViewController;
- (instancetype) init;

@property (nonatomic, strong) MMDrawerController *drawerController;

@end


@implementation JumpViewController

+ (void)createViewControllerWithIndex:(NSUInteger)index
{
    JumpViewController *jumpViewController = [JumpViewController sharedJumpViewController];
    [jumpViewController openViewWithIndex:index];
}

#pragma mark -

+ (JumpViewController *)sharedJumpViewController
{
    NSString *classString = NSStringFromClass([self class]);
    if ([classString isEqualToString:@"JumpViewController"])
    {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            jumpVC = (JumpViewController *)@"JumpViewController";
            jumpVC = [[JumpViewController alloc] init];
        });
    }
    else
    {
        NSLog(@"非 JumpViewController 类 , 无法进行 JumpViewController 的单利");
        return nil;
    }
    return jumpVC;
}

- (instancetype) init
{
    NSString *string = (NSString *)jumpVC;
    if ([string isKindOfClass:[NSString class]] == YES &&
        [string isEqualToString:@"JumpViewController"])
    {
        self = [super init];
        if (self) {
            
        }
        return self;
    }
    else
    {
        NSLog(@"JumpViewController 类只能单利 , 无法进行 init");
        return nil;
    }
}

#pragma mark -

- (void)openViewWithIndex:(NSUInteger)index
{
    UIViewController *leftVC = [[LeftViewController alloc] init];
    UIViewController *rightVC = [[RightViewController alloc] init];
    UIViewController *centerVC = nil;
    
    UINavigationController *leftBasicNav = [[BasicViewController alloc] initWithRootViewController:leftVC];
    [leftBasicNav setRestorationIdentifier:RI_LEFT_VCRK];
    UINavigationController *rightBasicNav = [[BasicViewController alloc] initWithRootViewController:rightVC];
    [rightBasicNav setRestorationIdentifier:RI_RIGHT_VCRK];
    UINavigationController *centerBasicNav = nil;
    
    switch (index)
    {
        case 0:
            centerVC = [[FirstViewController alloc] init];
            centerBasicNav = [[BasicViewController alloc] initWithRootViewController:centerVC];
            [centerBasicNav setRestorationIdentifier:RI_FIRST_VCRK];
            break;
            
        case 1:
            centerVC = [[SecondViewController alloc] init];
            centerBasicNav = [[BasicViewController alloc] initWithRootViewController:centerVC];
            [centerBasicNav setRestorationIdentifier:RI_SECOND_VCRK];
            break;
        default:
            NSLog(@"界面跳转控制器中传入了错误的下标");
            break;
    }
    
    if (centerVC != nil)
    {
        // 设置界面关系
        self.drawerController = [[MMDrawerController alloc] initWithCenterViewController:centerBasicNav
                                                                leftDrawerViewController:leftBasicNav
                                                               rightDrawerViewController:rightBasicNav];
        // 显示阴影
        [self.drawerController setShowsShadow:NO];
        [self.drawerController setRestorationIdentifier:RI_DRAWER_VCRK];
        // 显示左侧界面时的最大偏移值
        [self.drawerController setMaximumRightDrawerWidth:[Globe getScreenWidth]];
        [self.drawerController setMaximumLeftDrawerWidth:[Globe getScreenWidth] * 3 / 4];
        
        [self.drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
        [self.drawerController setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
        
        // 界面没有弹跳效果
        [self.drawerController setCloseDrawerGestureModeMask:MMCloseDrawerGestureModePanningDrawerView];
        
        [self.drawerController setDrawerVisualStateBlock:^(MMDrawerController *drawerController,
                                                           MMDrawerSide drawerSide,
                                                           CGFloat percentVisible) {
            MMDrawerControllerDrawerVisualStateBlock block = [MMDrawerVisualState slideVisualStateBlock];
            if (block) {
                block(drawerController,drawerSide,percentVisible);
            }
         }];
        
        UIColor * tintColor = [UIColor colorWithRed:29.0/255.0
                                              green:173.0/255.0
                                               blue:234.0/255.0
                                              alpha:1.0];
        
        [UIApplication sharedApplication].keyWindow.tintColor = tintColor;
        [UIApplication sharedApplication].keyWindow.rootViewController = self.drawerController;
        
        [self.drawerController closeDrawerAnimated:YES completion:nil];
    }
}

#pragma mark -










@end
