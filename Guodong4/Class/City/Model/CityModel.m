//
//  CityModel.m
//  Guodong4
//
//  Created by mac on 16/9/1.
//  Copyright © 2016年 Hao Sheng. All rights reserved.
//

#import "CityModel.h"

@implementation CityModel

- (void)startRequest {
    
     NSString* url = [NSString stringWithFormat:@"%@citys/", BASEURL];
    [HttpTool postWithUrl:url params:nil body:nil progress:^(NSProgress * progress) {
        
    } success:^(id responseObject) {
       
        [self getDataSuccessWithDict:responseObject];
       
    }];
}

- (void)getDataSuccessWithDict:(NSDictionary *)dict {
    
    NSArray *cityArray = [dict objectForKey:@"all_citys"];
    self.returnBlock(cityArray);
    
}

@end
