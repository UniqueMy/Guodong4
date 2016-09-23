//
//  ClassTableHeadView.m
//  Guodong4
//
//  Created by mac on 16/9/2.
//  Copyright © 2016年 Hao Sheng. All rights reserved.
//

#import "ClassTableHeadView.h"
#import "ClassModel.h"
#import "SDCycleScrollView.h" // 第三方ScrollView

@interface ClassTableHeadView ()<UIScrollViewDelegate,SDCycleScrollViewDelegate>

@property (nonatomic,strong) NSMutableArray    *bannnerImageArray;
@property (nonatomic,strong) SDCycleScrollView *bannerScroll;
@property (nonatomic,strong) UIImageView       *chooseImageView;
@property (nonatomic,strong) UILabel           *chooseClassLabel;
@property (nonatomic,strong) UILabel           *chooseShopLabel;
@property (nonatomic,strong) UIButton          *classButton;
@property (nonatomic,strong) UIButton          *shopButton;


@end

@implementation ClassTableHeadView

#pragma mark -- 懒加载
- (SDCycleScrollView *)bannerScroll {
    if (!_bannerScroll) {
        CGRect frame = CGRectMake(0,0,viewWidth,Adaptive(125));
        
        _bannerScroll = [SDCycleScrollView cycleScrollViewWithFrame:frame delegate:self placeholderImage:nil];
        
        _bannerScroll.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
        _bannerScroll.pageControlStyle   = SDCycleScrollViewPageContolStyleAnimated;
        _bannerScroll.autoScrollTimeInterval = 5.0;
        _bannerScroll.userInteractionEnabled = YES;
        [self addSubview:_bannerScroll];
    }
    return _bannerScroll;
}

- (UIImageView *)chooseImageView {
    if (!_chooseImageView) {
        _chooseImageView       = [[UIImageView alloc] init];
        _chooseImageView.frame = CGRectMake(0,
                                            CGRectGetMaxY(self.bannerScroll.frame) + Adaptive(5),
                                            viewWidth,
                                            Adaptive(30));
        [_chooseImageView setImage:[UIImage imageNamed:@"shouye_classImage"]];
        _chooseImageView.userInteractionEnabled = YES;
        [self addSubview:_chooseImageView];
    }
    return _chooseImageView;
}

- (UILabel *)chooseClassLabel {
    if (!_chooseClassLabel) {
        _chooseClassLabel       = [[UILabel alloc] init];
        _chooseClassLabel.frame = CGRectMake(0,
                                             (self.chooseImageView.bounds.size.height - Adaptive(16)) / 2,
                                             viewWidth / 2,
                                             Adaptive(16));
        _chooseClassLabel.textColor     = [UIColor whiteColor];
        _chooseClassLabel.text          = @"课程";
        _chooseClassLabel.textAlignment = 1;
        _chooseClassLabel.font          = [UIFont fontWithName:FONT size:Adaptive(15)];
        [self.chooseImageView addSubview:_chooseClassLabel];
    }
    return _chooseClassLabel;
}

- (UILabel *)chooseShopLabel {
    if (!_chooseShopLabel) {
        _chooseShopLabel       = [[UILabel alloc] init];
        _chooseShopLabel.frame = CGRectMake(viewWidth / 2,
                                            (self.chooseImageView.bounds.size.height - Adaptive(16)) / 2,
                                            viewWidth / 2,
                                            Adaptive(16));
        _chooseShopLabel.textColor     = [UIColor whiteColor];
        _chooseShopLabel.text          = @"体验店";
        _chooseShopLabel.textAlignment = 1;
        _chooseShopLabel.font          = [UIFont fontWithName:FONT size:Adaptive(15)];
        [self.chooseImageView addSubview:_chooseShopLabel];
    }
    return _chooseShopLabel;
}

- (UIButton *)classButton {
    if (!_classButton) {
        _classButton       = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _classButton.frame = CGRectMake(0, 0, viewWidth / 2, self.chooseImageView.bounds.size.height);
        _classButton.tag   = 11;
        [_classButton addTarget:self action:@selector(changeClassOrShop:) forControlEvents:UIControlEventTouchUpInside];
        [self.chooseImageView addSubview:_classButton];
    }
    return _classButton;
}

- (UIButton *)shopButton {
    if (!_shopButton) {
        _shopButton       = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _shopButton.frame = CGRectMake(viewWidth / 2, 0, viewWidth / 2, self.chooseImageView.bounds.size.height);
        _shopButton.tag   = 22;
        [_shopButton addTarget:self action:@selector(changeClassOrShop:) forControlEvents:UIControlEventTouchUpInside];
        [self.chooseImageView addSubview:_shopButton];
    }
    return _classButton;
}

#pragma mark -- 选择课程或者体验店
- (void)changeClassOrShop:(UIButton *)button {
    NSLog(@"button.tag %ld",(long)button.tag);
    
    if (button.tag == 11) {
        [self.chooseImageView setImage:[UIImage imageNamed:@"shouye_classImage"]];
        [self getClassModelForClass];
    } else {
        [self.chooseImageView setImage:[UIImage imageNamed:@"shouye_shopImage"]];
        [self getClassModelForShop];
    }
    
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = BASECOLOR;
        
        [self chooseImageView];
        [self chooseClassLabel];
        [self chooseShopLabel];
        [self classButton];
        [self shopButton];
        
        [self getClassModelForClass];
        
    }
    return self;
}

- (void)getClassModelForClass {
    
    ClassModel *classModel = [ClassModel sharedViewManager];
    
    [classModel setBannerModelWithReturnBlock:^(id Value) {
        
    } BannerImageBlock:^(id Value) {
        
        self.bannerScroll.imageURLStringsGroup = (NSArray *)Value;
        
    } Class:^(id Value,id Dict) {

        [self sendValueToClassTableViewWith:(NSArray *)Value dict:(NSDictionary *)Dict];
    }];
    
    
    [classModel startRequestClassValue];
}

- (void)getClassModelForShop {
    
    ClassModel *classModel = [ClassModel sharedViewManager];
    
    [classModel setShopModelWithReturnBlock:^(id Value) {
        
        [self sendValueToShopWith:(NSArray*)Value];
    }];
    
       [classModel startRequestShopValue];
}


- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {
    
    NSLog(@"index %ld",(long)index);
}

#pragma mark -- Delegate

- (void)sendValueToClassTableViewWith:(NSArray *)value dict:(NSDictionary *)dict{
    
    // 如果协议响应了sendValue:方法
    if ([_delegate respondsToSelector:@selector(getClassModelByTableHeadWithValue: dict:)]) {
        // 通知执行协议方法
        [_delegate getClassModelByTableHeadWithValue:value dict:dict];
    }
}

- (void)sendValueToShopWith:(NSArray *)value {
    
    // 如果协议响应了sendValue:方法
    if ([_delegate respondsToSelector:@selector(getShopValueByTableHeadWithValue:)]) {
        // 通知执行协议方法
        [_delegate getShopValueByTableHeadWithValue:value];
    }
}


@end
