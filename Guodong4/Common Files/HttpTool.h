//
//  HttpTool.h
//  Guodong4
//
//  Created by mac on 16/8/31.
//  Copyright © 2016年 Hao Sheng. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^ProgressBlock)(NSProgress *progress);
typedef void (^SuccessBlock)(id responseObject);
typedef void (^FailBlock)(NSError* error);


@interface HttpTool : NSObject

+ (void)postWithUrl:(NSString*)urlStr params:(NSDictionary*)params body:(NSArray *)body progress:(ProgressBlock)progress success:(SuccessBlock)success;


@end
