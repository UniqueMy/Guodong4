//
//  ClassTableHeadView.m
//  Guodong4
//
//  Created by mac on 16/9/2.
//  Copyright © 2016年 Hao Sheng. All rights reserved.
//

#import "ClassTableHeadView.h"

@implementation ClassTableHeadView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.frame = CGRectMake(0, Status_height + NavigationBar_Height, viewWidth, Adaptive(165));
        self.backgroundColor = [UIColor whiteColor];
       
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
}

@end
