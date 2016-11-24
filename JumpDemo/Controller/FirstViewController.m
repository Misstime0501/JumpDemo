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

#import "WeatherInformationViewController.h"

@interface FirstViewController ()
<UIPageViewControllerDataSource>
@property (assign)             NSUInteger pageIndex;
@property (nonatomic , strong) UIPageControl *pageControl;
@property (nonatomic , strong) UIPageViewController *pageController;


@property (nonatomic , strong) UIButton *titleButton;

@end

@implementation FirstViewController
@synthesize titleButton = _titleButton;

@synthesize pageIndex = _pageIndex;
@synthesize pageCount = _pageCount;
@synthesize pageControl = _pageControl;

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setRestorationIdentifier:RI_FIRST_VCRK];
        self.view.backgroundColor = [UIColor clearColor];
        _pageControl = [[UIPageControl alloc] init];
        _pageCount = 4;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createPageController:0];
    
    [self createLeftButton];
    [self createRightButton];
    [self createTitleButton];
    
//    UIColor * barColor = [UIColor colorWithRed:247.0/255.0 green:249.0/255.0 blue:250.0/255.0 alpha:1.0];
    [self.navigationController.navigationBar setBarTintColor:[UIColor clearColor]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark -

- (void)createPageController:(NSInteger)index {

//    [_pageControl setNumberOfPages:_pageCount];
//
//    [_pageControl setCurrentPage:0];
//    [_pageControl setFrame:CGRectMake(50, 80, 100, 40)];
//    [_pageControl setPageIndicatorTintColor:[UIColor lightGrayColor]];
//    [_pageControl setCurrentPageIndicatorTintColor:[UIColor orangeColor]];
//    [_pageControl setBackgroundColor:[UIColor brownColor]];
//    [[self view] addSubview:_pageControl];

    // 设置翻页方式
    self.pageController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll
                                                          navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal
                                                                        options:nil];
    self.pageController.dataSource = self;
    self.pageController.view.frame = CGRectMake(CGRectGetMinX(self.view.frame), CGRectGetMinY(self.view.frame), CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame) - CGRectGetHeight(self.tabBarController.tabBar.frame));
    
    WeatherInformationViewController *currnet = [self viewControllerAtIndex:index];
    [self.pageController setViewControllers:@[currnet] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    [self addChildViewController:self.pageController];
    [self.view addSubview:self.pageController.view];
    [self.pageController didMoveToParentViewController:self];
}

#pragma mark -

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    return self.pageCount;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    return 0;
}

// 向前翻转
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    if ((_pageIndex == 0) || (_pageIndex == NSNotFound)) {
        return nil;
    }
    _pageIndex--;
    return [self viewControllerAtIndex:_pageIndex];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    if ((_pageIndex == self.pageCount) || (_pageIndex == NSNotFound)) {
        return nil;
    }
    _pageIndex++;
    return [self viewControllerAtIndex:_pageIndex];
}

- (WeatherInformationViewController *)viewControllerAtIndex:(NSUInteger)index{
    WeatherInformationViewController *current = [[WeatherInformationViewController alloc] init];
    return current;
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
