//
//  FirstViewController.m
//  JumpDemo
//
//  Created by Chen Li on 2016/11/24.
//  Copyright © 2016年 Chen Li. All rights reserved.
//

#import "FirstViewController.h"

#import "MacroOfDefine_Const.h"

#import "MMDrawerBarButtonItem.h"
#import "UIViewController+MMDrawerController.h"

@interface FirstViewController ()

@property (nonatomic , strong) UIButton *titleButton;

@end

@implementation FirstViewController
@synthesize titleButton = _titleButton;

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setRestorationIdentifier:RI_FIRST_VCRK];
        self.view.backgroundColor = [UIColor whiteColor];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createLeftButton];
    [self createRightButton];
    [self createTitleButton];
    
    UIColor * barColor = [UIColor colorWithRed:247.0/255.0 green:249.0/255.0 blue:250.0/255.0 alpha:1.0];
    [self.navigationController.navigationBar setBarTintColor:barColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark -

- (void)createLeftButton {
    MMDrawerBarButtonItem * leftButton = [[MMDrawerBarButtonItem alloc] initWithTarget:self action:@selector(leftButtonPress:)];
    [self.navigationItem setLeftBarButtonItem:leftButton animated:YES];
}

- (void)createRightButton {
    MMDrawerBarButtonItem * rightButton = [[MMDrawerBarButtonItem alloc] initWithTarget:self action:@selector(rightButtonPress:)];
    [self.navigationItem setRightBarButtonItem:rightButton animated:YES];
}

- (void)createTitleButton {
    _titleButton = [[UIButton alloc] init];
    
    [_titleButton setTitle:@"北京" forState:UIControlStateNormal];
    [_titleButton setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    [_titleButton setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateHighlighted];
    [_titleButton addTarget:self action:@selector(titleButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationItem setTitleView:_titleButton];
}

-(void)leftButtonPress:(id)sender{
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
}

-(void)rightButtonPress:(id)sender{
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideRight animated:YES completion:nil];
}

- (void)titleButtonClicked:(id)sender {
    NSLog(@"点击了标题");
    [_titleButton setTitle:@"天津" forState:UIControlStateNormal];
}

@end
