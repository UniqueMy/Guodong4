//
//  ClassPublicModel.h
//  Guodong4
//
//  Created by mac on 16/9/2.
//  Copyright © 2016年 Hao Sheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ClassPublicModel : NSObject

// 定位
@property (nonatomic,strong) NSString *allow_CityName;
@property (nonatomic,strong) NSString *now_CityName;
@property (nonatomic)        BOOL      is_allowed;

@end
