//
//  ClassModel.m
//  Guodong4
//
//  Created by mac on 16/9/2.
//  Copyright © 2016年 Hao Sheng. All rights reserved.
//

#import "ClassModel.h"
#import "ClassPublicModel.h"

@implementation ClassModel


- (void)startRequest {
    
     NSString *url = [NSString stringWithFormat:@"%@api/?method=index.index",BASEURL];
    [HttpTool postWithUrl:url params:nil body:nil progress:^(NSProgress * progress) {
        
    } success:^(id responseObject) {
        
        [self getValueSuccessWithDict:responseObject];
        
    }];
    
}

- (void)getValueSuccessWithDict:(NSDictionary *)dict {
 
    
    
}

@end
