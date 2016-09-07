//
//  ClassViewModel.h
//  Guodong4
//
//  Created by mac on 16/9/2.
//  Copyright © 2016年 Hao Sheng. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^BannerModelBlock)(id Value);
typedef void(^BannerImageBlock)(id Value);
typedef void(^ClassValueBlock)(id Value);

@interface ClassViewModel : NSObject

@property (nonatomic,copy) BannerModelBlock BannerModelBlock;
@property (nonatomic,copy) BannerImageBlock BannerImageBlock;
@property (nonatomic,copy) ClassValueBlock  ClassBlock;

- (void)setBannerModelWithReturnBlock:(BannerModelBlock)BannerModelBlock BannerImageBlock:(BannerImageBlock) BannerImageBlock Class:(ClassValueBlock) ClassBlock;
//- (void)setBannerImageWithReturnBlock:(BannerImageBlock)BannerImageBlock;
//- (void)setClassWithReturnBlock:(ClassValueBlock)ClassBlock;

@end
