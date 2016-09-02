//
//  LocationView.h
//  Guodong4
//
//  Created by mac on 16/8/31.
//  Copyright © 2016年 Hao Sheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LocationView : UIView

// 模态提示框
@property (nonatomic,copy)   void(^PresentViewController)(UIAlertController *alertController);

// push到cityViewController
@property (nonatomic,copy)   void(^PushCityViewController)(NSString *cityName);

- (void)startAnimation;



@end
