//
//  CityViewModel.h
//  Guodong4
//
//  Created by mac on 16/9/1.
//  Copyright © 2016年 Hao Sheng. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^ReturnValueBlock)(id Value);

@interface CityViewModel : NSObject

@property (nonatomic,strong) ReturnValueBlock returnBlock;

// 传入交互的Block
- (void)setBlockWithReturnBlock:(ReturnValueBlock) returnBlock;

@end
