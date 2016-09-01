//
//  LocationModel.m
//  Guodong4
//
//  Created by mac on 16/8/31.
//  Copyright © 2016年 Hao Sheng. All rights reserved.
//

#import "LocationModel.h"


@interface LocationModel ()

@property (nonatomic,strong) NSString *city;
@property (nonatomic)   BOOL      allow;

@end


@implementation LocationModel

- (void)startRequestCityNameWithLocationDict:(NSDictionary *)dict {
    NSLog(@"dict %@",dict);
    NSString *urlString = [NSString stringWithFormat:@"%@geocoding/",BASEURL];
    [HttpTool postWithUrl:urlString params:dict body:nil progress:^(NSProgress *progress) {
        
    } success:^(id responseObject) {
        
        [self getValueSuccessWithDict:responseObject];
        
    }];
}

- (void)getValueSuccessWithDict:(NSDictionary *)dict {
    
    _city               = [[dict objectForKey:@"city"] objectForKey:@"name"];
    NSString *city_code = [NSString stringWithFormat:@"%@",[[dict objectForKey:@"city"] objectForKey:@"city_code"]];
    _allow              = [[dict objectForKey:@"allowd"] containsObject:city_code] ? YES : NO;
    self.returnBlock(@{@"city":_city,@"allow":[NSNumber numberWithBool:_allow]});
}

@end
