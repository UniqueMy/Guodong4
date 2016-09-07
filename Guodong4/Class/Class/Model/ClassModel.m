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
    
    
    
    
    NSArray        *carouselArray      = [dict objectForKey:@"carousel"];
    NSMutableArray *bannerModelArray   = [NSMutableArray array];
    NSMutableArray *bannerImageArray   = [NSMutableArray array];
    for (NSDictionary *carouseDict in carouselArray) {
        ClassPublicModel *publicModel = [[ClassPublicModel alloc] init];
        publicModel.banner_image      = [carouseDict objectForKey:@"img"];
        publicModel.banner_url        = [carouseDict objectForKey:@"url"];
        publicModel.banner_name       = [carouseDict objectForKey:@"name"];
        publicModel.banner_type       = [carouseDict objectForKey:@"type"];
        [bannerModelArray addObject:publicModel];
        [bannerImageArray addObject:publicModel.banner_image];
    }
    self.BannerModelBlock(bannerModelArray);
    self.BannerImageBlock(bannerImageArray);
    
    
    
    NSArray        *courseArray  = [dict objectForKey:@"course"];
    NSMutableArray *classArray   = [NSMutableArray array];
    for (NSDictionary *courseDict in courseArray) {
        ClassPublicModel *publicModel = [[ClassPublicModel alloc] init];
        publicModel.class_image       = [courseDict objectForKey:@"imgUrl"];
        publicModel.class_name        = [courseDict objectForKey:@"name"];
        publicModel.class_number      = [courseDict objectForKey:@"number"];
        publicModel.class_classid     = [courseDict objectForKey:@"class_id"];
        [classArray addObject:publicModel];
    }
    
    self.ClassBlock(classArray);
    
    
    
}


+ (instancetype)sharedViewManager {
    static dispatch_once_t  onceToken;
    static ClassModel      *classModel;
    
    dispatch_once(&onceToken, ^{
        classModel = [[ClassModel alloc] init];
    });
    return classModel;
}

@end
