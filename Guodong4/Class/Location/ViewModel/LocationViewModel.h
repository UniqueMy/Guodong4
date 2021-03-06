//
//  LocationViewModel.h
//  Guodong4
//
//  Created by mac on 16/8/31.
//  Copyright © 2016年 Hao Sheng. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^ReturnValueBlock) (id returnValue);

@interface LocationViewModel : NSObject

@property (nonatomic,strong) ReturnValueBlock returnBlock;

// 传入交互的Block
- (void)setBlockWithReturnBlock:(ReturnValueBlock) returnBlock;

@end
