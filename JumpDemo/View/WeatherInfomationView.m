//
//  WeatherInfomationView.m
//  JumpDemo
//
//  Created by Chen Li on 2016/11/24.
//  Copyright © 2016年 Chen Li. All rights reserved.
//

#import "WeatherInfomationView.h"
#import "MacroOfDefine_Const.h"

@interface WeatherInfomationView () <UITableViewDelegate , UITableViewDataSource>




@end


@implementation WeatherInfomationView

- (instancetype)initWithCurrentWeatherInformation:(NSDictionary *)informationDictionary {
    if (self = [super init]) {
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    
}

- (void)setupSubviews {
    
}

#pragma mark - back table view

- (UITableView *)cityInfoTableView {
    if (!_cityInfoTableView) {
        _cityInfoTableView = [[UITableView alloc] initWithFrame:CGRectMake(ZERO, ZERO, SCREEN_WIDTH, SCREEN_HEIGHT)];
        
        _cityInfoTableView.bounces = YES;
        _cityInfoTableView.backgroundColor = [UIColor clearColor];
        _cityInfoTableView.delegate = self;
        _cityInfoTableView.dataSource = self;
        _cityInfoTableView.showsVerticalScrollIndicator = NO;
        _cityInfoTableView.showsHorizontalScrollIndicator = NO;
        _cityInfoTableView.scrollEnabled = NO;
    }
    return _cityInfoTableView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"Main %ld", (long)indexPath.row];
    cell.backgroundColor = [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.1];
    
    cell.selectionStyle = NO;
    return cell;
}








@end
