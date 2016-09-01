//
//  SHNavgationView.h
//  Guodong4
//
//  Created by mac on 16/8/30.
//  Copyright © 2016年 Hao Sheng. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,SHNavigationStyle) {
    
    SHNavgationStyleLastView  = 0,  // Pop到上一个视图
    SHNavgationStyleRootView  = 1,  // Pop到根视图
    
};

@interface SHNavgationView : UIView

- (instancetype)initWithTitle:(NSString *)title  Style:(SHNavigationStyle)style Controller:(UIViewController *)controller;

@end
