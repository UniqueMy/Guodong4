//
//  ClassTableHeadView.h
//  Guodong4
//
//  Created by mac on 16/9/2.
//  Copyright © 2016年 Hao Sheng. All rights reserved.
//
#import <Foundation/NSObject.h>
#import <UIKit/UIKit.h>

@protocol ClassTableHeadDelegate <NSObject>

@required

- (void)getClassModelByTableHeadWithValue:(NSArray *)value dict:(NSDictionary *)dict;
- (void)getShopValueByTableHeadWithValue:(NSArray *)value;

@end

@interface ClassTableHeadView : UIView

@property (nonatomic,weak) id <ClassTableHeadDelegate> delegate;

@end
