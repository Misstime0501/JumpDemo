//
//  Globe.m
//  JumpViewDemo
//
//  Created by Chen Li on 2016/11/17.
//  Copyright © 2016年 Chen Li. All rights reserved.
//

#import "Globe.h"

static Globe *globe = nil;

@interface Globe ()

@property (nonatomic) CGFloat screenWidth;
@property (nonatomic) CGFloat screenHeight;
@property (nonatomic) BOOL    addCity;

+ (Globe *)sharedGlobe;

- (instancetype) init;
- (void)setScreenWidth:(CGFloat)screenWidth;
- (void)setScreenHeight:(CGFloat)screenHeight;
- (CGFloat)getScreenWidth;
- (CGFloat)getScreenHeight;


- (void)setRealyAddCity:(BOOL)addCity;
- (BOOL)getRealyAddCity;

@end

@implementation Globe

@synthesize screenWidth = _screenWidth;
@synthesize screenHeight = _screenHeight;
@synthesize addCity = _addCity;


+ (Globe *)sharedGlobe
{
    NSString *classString = NSStringFromClass([self class]);
    if ([classString isEqualToString:@"Globe"])
    {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            globe = (Globe *)@"Globe";
            globe = [[Globe alloc] init];
        });
    }
    else
    {
        NSLog(@"非 globe 类 , 无法进行 globe 的单利");
        return nil;
    }
    return globe;
}

- (instancetype) init
{
    NSString *string = (NSString *)globe;
    if ([string isKindOfClass:[NSString class]] == YES &&
        [string isEqualToString:@"Globe"])
    {
        self = [super init];
        if (self) {
            [self setAddCity:NO];
        }
        return self;
    }
    else
    {
        NSLog(@"Globe 类只能单利 , 无法进行 init");
        return nil;
    }
}


+ (void)setScreenWidth:(CGFloat)screenWidth
{
    Globe *globe = [Globe sharedGlobe];
    [globe setScreenWidth:screenWidth];
}

- (void)setScreenWidth:(CGFloat)screenWidth
{
    _screenWidth = screenWidth;
}

+ (CGFloat)getScreenWidth
{
    Globe *globe = [Globe sharedGlobe];
    return [globe getScreenWidth];
}

- (CGFloat)getScreenWidth
{
    return _screenWidth;
}

+ (void)setScreenHeight:(CGFloat)screenHeight
{
    Globe *globe = [Globe sharedGlobe];
    [globe setScreenHeight:screenHeight];
}

- (void)setScreenHeight:(CGFloat)screenHeight
{
    _screenHeight = screenHeight;
}

+ (CGFloat)getScreenHeight
{
    Globe *globe = [Globe sharedGlobe];
    return [globe getScreenHeight];
}

- (CGFloat)getScreenHeight
{
    return _screenHeight;
}

+ (void)setRealyAddCity:(BOOL)addCity
{
    Globe *globe = [Globe sharedGlobe];
    [globe setRealyAddCity:addCity];
}

- (void)setRealyAddCity:(BOOL)addCity
{
    _addCity = addCity;
}

+ (BOOL)getRealyAddCity
{
    Globe *globe = [Globe sharedGlobe];
    return [globe getRealyAddCity];
}

- (BOOL)getRealyAddCity
{
    return _addCity;
}





@end
