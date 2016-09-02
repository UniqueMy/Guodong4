//
//  CityCell.m
//  Guodong4
//
//  Created by mac on 16/9/1.
//  Copyright © 2016年 Hao Sheng. All rights reserved.
//

#import "CityCell.h"

@interface CityCell ()

@property (nonatomic,strong) UILabel  *line;
@property (nonatomic,strong) UILabel  *cityLabel;

@end

@implementation CityCell

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
        _cityLabel.font      = [UIFont fontWithName:FONT size:Adaptive(15)];
        _cityLabel.textColor = [UIColor colorWithRed:187 / 255.0
                                               green:187 / 255.0
                                                blue:187 / 255.0
                                               alpha:1];
        _cityLabel.frame     = CGRectMake(Adaptive(30),
                                          Adaptive(38),
                                          Adaptive(150),
                                          Adaptive(15));
        [self addSubview:_cityLabel];
    }
    return _cityLabel;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        // 把自定义的控件 变成了单元格的属性
        self.backgroundColor = BASECOLOR;
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.line.frame = CGRectMake(Adaptive(20),
                                 self.frame.size.height - .5,
                                 viewWidth - Adaptive(40),
                                 .5);
    
}

- (void)setValueWithModel:(ClassPublicModel *)classPublicModel {
    
    self.cityLabel.text = classPublicModel.allow_CityName;
}

@end
