//
//  ClassViewModel.h
//  Guodong4
//
//  Created by mac on 16/9/2.
//  Copyright © 2016年 Hao Sheng. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^ReturnValueBlock)(id Value);

@interface ClassViewModel : NSObject

@property (nonatomic,copy) ReturnValueBlock returnBlock;

@end
