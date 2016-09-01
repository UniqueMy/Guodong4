//
//  CityHeadView.m
//  Guodong4
//
//  Created by mac on 16/9/1.
//  Copyright © 2016年 Hao Sheng. All rights reserved.
//

#import "CityHeadView.h"

@implementation CityHeadView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
         NSLog(@"city %@",_cityName);
    }
    return self;
}
- (void)createUI {
    
    NSLog(@"city %@",_cityName);
}

@end
