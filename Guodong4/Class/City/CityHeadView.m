//
//  CityHeadView.m
//  Guodong4
//
//  Created by mac on 16/9/1.
//  Copyright © 2016年 Hao Sheng. All rights reserved.
//

#import "CityHeadView.h"

@interface CityHeadView ()

@property (nonatomic,strong) UILabel  *line;
@property (nonatomic,strong) UILabel  *cityLabel;


@end

@implementation CityHeadView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self createUI];
    }
    return self;
}

#pragma mark -- 懒加载
- (UILabel *)line {
    if (!_line) {
        _line                 = [[UILabel alloc] init];
        _line.backgroundColor = ORANGECOLOR;
        [self addSubview:_line];
    }
    return _line;
}

- (UILabel *)cityLabel {
    if (!_cityLabel) {
        _cityLabel           = [[UILabel alloc] init];
        _cityLabel.font      = [UIFont fontWithName:FONT size:Adaptive(18)];
        _cityLabel.textColor = ORANGECOLOR;
        _cityLabel.frame     = CGRectMake(Adaptive(30),
                                          Adaptive(38),
                                          Adaptive(150),
                                          Adaptive(18));
        [self addSubview:_cityLabel];
    }
    return _cityLabel;
}


- (void)layoutSubviews {
    [super layoutSubviews];
    self.line.frame = CGRectMake(Adaptive(20),
                                 self.bounds.size.height - .5,
                                 viewWidth - Adaptive(40),
                                 .5);
    self.cityLabel.text = _cityName;
    
}

- (void)createUI {
    
    self.backgroundColor = BASECOLOR;
    
    UILabel * currentLabel = [[UILabel alloc] init];
    currentLabel.font      = [UIFont fontWithName:FONT size:Adaptive(15)];
    currentLabel.textColor = [UIColor colorWithRed:102 / 255.0 green:102 / 255.0 blue:102 / 255.0 alpha:1];
    currentLabel.frame     = CGRectMake(viewWidth - Adaptive(100),
                                        Adaptive(38),
                                        Adaptive(70),
                                        Adaptive(15));
    currentLabel.textAlignment = 1;
    currentLabel.text          = @"当前城市";
    [self addSubview:currentLabel];
    
}

@end
