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

// Banner
@property (nonatomic,strong) NSString *banner_image;
@property (nonatomic,strong) NSString *banner_name;
@property (nonatomic,strong) NSString *banner_url;
@property (nonatomic,strong) NSString *banner_type;

// Class
@property (nonatomic,strong) NSString *class_image;
@property (nonatomic,strong) NSString *class_classid;
@property (nonatomic,strong) NSString *class_name;
@property (nonatomic,strong) NSString *class_number;
@end
