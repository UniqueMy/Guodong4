//
//  LocationModel.h
//  Guodong4
//
//  Created by mac on 16/8/31.
//  Copyright © 2016年 Hao Sheng. All rights reserved.
//

#import "LocationViewModel.h"

@interface LocationModel : LocationViewModel

- (void)startRequestCityNameWithLocationDict:(NSDictionary *)dict;

@end
