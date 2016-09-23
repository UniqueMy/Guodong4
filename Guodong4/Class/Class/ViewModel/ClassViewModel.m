//
//  ClassViewModel.m
//  Guodong4
//
//  Created by mac on 16/9/2.
//  Copyright © 2016年 Hao Sheng. All rights reserved.
//

#import "ClassViewModel.h"

@implementation ClassViewModel

- (void)setBannerModelWithReturnBlock:(BannerModelBlock)BannerModelBlock BannerImageBlock:(BannerImageBlock)BannerImageBlock Class:(ClassValueBlock)ClassBlock {
    
    _BannerModelBlock = BannerModelBlock;
    _ClassBlock = ClassBlock;
    _BannerImageBlock = BannerImageBlock;
}

- (void)setShopModelWithReturnBlock:(ShopValueBlock)ShopBlock {
    
    _ShopBlock = ShopBlock;
}

@end
