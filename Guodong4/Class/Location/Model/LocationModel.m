//
//  LocationModel.m
//  Guodong4
//
//  Created by mac on 16/8/31.
//  Copyright © 2016年 Hao Sheng. All rights reserved.
//

#import "LocationModel.h"
#import "ClassPublicModel.h"

@interface LocationModel ()


@end


@implementation LocationModel

- (void)startRequestCityNameWithLocationDict:(NSDictionary *)dict {
    NSString *urlString = [NSString stringWithFormat:@"%@geocoding/",BASEURL];
    [HttpTool postWithUrl:urlString params:dict body:nil progress:^(NSProgress *progress) {
        
    } success:^(id responseObject) {
        
        [self getValueSuccessWithDict:responseObject];
        
    }];
}

- (void)getValueSuccessWithDict:(NSDictionary *)dict {
    
 
    NSString *city_code = [NSString stringWithFormat:@"%@",[[dict objectForKey:@"city"] objectForKey:@"city_code"]];
  
    ClassPublicModel *classPublicModel  = [[ClassPublicModel alloc] init];
    classPublicModel.now_CityName = [[dict objectForKey:@"city"] objectForKey:@"name"];
    classPublicModel.is_allowed   = [[dict objectForKey:@"allowd"] containsObject:city_code] ? YES : NO;
    
    self.returnBlock(classPublicModel);
}

@end
