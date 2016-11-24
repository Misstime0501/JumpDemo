//
//  Globe.h
//  JumpViewDemo
//
//  Created by Chen Li on 2016/11/17.
//  Copyright © 2016年 Chen Li. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Globe : NSObject

+ (void)setScreenWidth:(CGFloat)screenWidth;
+ (void)setScreenHeight:(CGFloat)screenHeight;

+ (CGFloat)getScreenWidth;
+ (CGFloat)getScreenHeight;

+ (void)setRealyAddCity:(BOOL)addCity;
+ (BOOL)getRealyAddCity;

@end
