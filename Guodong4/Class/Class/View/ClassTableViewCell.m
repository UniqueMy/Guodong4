//
//  ClassTableViewCell.m
//  Guodong4
//
//  Created by mac on 16/9/22.
//  Copyright © 2016年 Hao Sheng. All rights reserved.
//

#import "ClassTableViewCell.h"
#import "ClassPublicModel.h"

// 课程Cell

@implementation ClassTableViewCell

#pragma mark -- ClassCell 懒加载

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel                 = [[UILabel alloc] init];
        _titleLabel.frame           = CGRectMake(Adaptive(13),
                                                 Adaptive(13),
                                                 viewWidth / 2,
                                                 Adaptive(24));
        _titleLabel.font      = [UIFont fontWithName:FONT_BOLD size:Adaptive(22.5)];
        _titleLabel.textColor = [UIColor whiteColor];
        [self addSubview:_titleLabel];
        
    }
    return _titleLabel;
}

- (UILabel *)classNumberLabel {
    if (!_classNumberLabel) {
        _classNumberLabel                 = [[UILabel alloc] init];
        _classNumberLabel.frame           = CGRectMake(Adaptive(13),
                                                       CGRectGetMaxY(self.titleLabel.frame) +Adaptive(5),
                                                       viewWidth / 2,
                                                       Adaptive(14));
        _classNumberLabel.font      = [UIFont fontWithName:FONT size:Adaptive(12)];
        _classNumberLabel.textColor = [UIColor whiteColor];
        [self addSubview:_classNumberLabel];
        
    }
    return _classNumberLabel;
}

- (UIImageView *)backgroundImageView {
    if (!_backgroundImageView) {
        _backgroundImageView = [[UIImageView alloc] init];
        _backgroundImageView.frame = CGRectMake(0,
                                                Adaptive(5),
                                                viewWidth,
                                                Adaptive(120));
        [self addSubview:_backgroundImageView];
    }
    return _backgroundImageView;
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

- (void)setPublicModel:(ClassPublicModel *)publicModel {
    
    [self.backgroundImageView sd_setImageWithURL:[NSURL URLWithString:publicModel.class_image]];
    self.titleLabel.text       = publicModel.class_name;
    self.classNumberLabel.text = publicModel.class_number;
   
}

@end

// 最后一行Cell

@implementation LeftLastCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        // 把自定义的控件 变成了单元格的属性
        self.backgroundColor = BASECOLOR;
        self.moreLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, viewWidth, Adaptive(20))];
        self.moreLabel.textAlignment = 1;
        self.moreLabel.textColor     = [UIColor grayColor];
        self.moreLabel.font          = [UIFont fontWithName:FONT size:Adaptive(10)];
        [self addSubview:self.moreLabel];
        
    }
    return self;
}

@end

// 体验店Cell

@implementation ShopTableViewCell

#pragma mark -- ClassCell 懒加载

- (UIImageView *)backgroundImageView {
    if (!_backgroundImageView) {
        _backgroundImageView       = [[UIImageView alloc] init];
        _backgroundImageView.frame = CGRectMake(0, Adaptive(5), viewWidth, Adaptive(120));
        [self addSubview:_backgroundImageView];
    }
    return _backgroundImageView;
}

- (UIView *)alphaView {
    if (!_alphaView) {
        _alphaView       = [[UIView alloc] init];
        _alphaView.frame = CGRectMake(0,
                                      CGRectGetMaxY(self.backgroundImageView.frame) - Adaptive(42),
                                      viewWidth,
                                      Adaptive(42));
        _alphaView.backgroundColor = [UIColor blackColor];
        _alphaView.alpha           = 0.8;
        [self addSubview:_alphaView];
    }
    return _alphaView;
}

- (UILabel *)titleName {
    if (!_titleName) {
        _titleName           = [[UILabel alloc] init];
        _titleName.frame     = CGRectMake(Adaptive(13),
                                          Adaptive(12.5),
                                          viewWidth * 0.75,
                                          Adaptive(17));
        _titleName.textColor = ORANGECOLOR;
        _titleName.font      = [UIFont fontWithName:FONT size:Adaptive(17)];
        [self.alphaView addSubview:_titleName];
    }
    return _titleName;
}

- (UILabel *)branchName {
    if (!_branchName) {
        _branchName           = [[UILabel alloc] init];
        _branchName.frame     = CGRectMake(viewWidth * 0.75,
                                          Adaptive(13.5),
                                          viewWidth * 0.75,
                                          Adaptive(15));
        _branchName.textColor = [UIColor whiteColor];
        _branchName.font      = [UIFont fontWithName:FONT size:Adaptive(15)];
        [self.alphaView addSubview:_branchName];
    }
    return _branchName;
}


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        // 把自定义的控件 变成了单元格的属性
        self.backgroundColor = BASECOLOR;
        [self alphaView];
        
    }
    return self;
}

- (void)setPublicModel:(ClassPublicModel *)publicModel {
    
   // NSLog(@"ShoppublicModel %@",publicModel.shop_name);
    
    [self.backgroundImageView sd_setImageWithURL:[NSURL URLWithString:publicModel.shop_image]];
    self.titleName.text  = publicModel.shop_name;
    self.branchName.text = publicModel.shop_place;
    
}

@end

