//
//  CityModel.m
//  Guodong4
//
//  Created by mac on 16/9/1.
//  Copyright © 2016年 Hao Sheng. All rights reserved.
//

#import "CityModel.h"
#import "ClassPublicModel.h"

@implementation CityModel

- (void)startRequest {
    
     NSString* url = [NSString stringWithFormat:@"%@citys/", BASEURL];
    [HttpTool postWithUrl:url params:nil body:nil progress:^(NSProgress * progress) {
        
    } success:^(id responseObject) {
       
        [self getDataSuccessWithDict:responseObject];
       
    }];
}

- (void)getDataSuccessWithDict:(NSDictionary *)dict {
    
    NSMutableArray *modelArray = [NSMutableArray array];
    NSArray *cityArray         = [dict objectForKey:@"all_citys"];
    
    for (NSString *allow_CityName in cityArray) {
        ClassPublicModel *classPublicModel    = [[ClassPublicModel alloc] init];
        classPublicModel.allow_CityName = allow_CityName;
        [modelArray addObject:classPublicModel];
    }
    
    self.returnBlock(modelArray);
    
}

@end
