//
//  SHNavgationView.m
//  Guodong4
//
//  Created by mac on 16/8/30.
//  Copyright © 2016年 Hao Sheng. All rights reserved.
//

#import "SHNavgationView.h"

@implementation SHNavgationView
{
    UIViewController  *viewController;
    SHNavigationStyle  navigationStyle;
}
- (instancetype)initWithTitle:(NSString *)title  Style:(SHNavigationStyle)style Controller:(UIViewController *)controller
{
    self = [super init];
    if (self) {
        
       
        viewController       = controller;
        navigationStyle      = style;
        
        self.frame           = CGRectMake(0,
                                          0,
                                          viewWidth,
                                          Status_height + NavigationBar_Height);
        self.backgroundColor = ORANGECOLOR;
        
        
        UIImageView *backImageView = [[UIImageView alloc] init];
        backImageView.frame        = CGRectMake(Space_Width,
                                                Status_height + (NavigationBar_Height - Adaptive(16.5)) / 2,
                                                Adaptive(9.75),
                                                Adaptive(16.5));
        backImageView.image        = [UIImage imageNamed:@"every_back"];
        [self addSubview:backImageView];
        
        UIButton *backButton       = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        backButton.frame        = CGRectMake(0,
                                                Status_height,
                                                Adaptive(35),
                                                NavigationBar_Height);
        [backButton addTarget:self action:@selector(backButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:backButton];
        
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.frame    = CGRectMake(Adaptive(100),
                                         Status_height + (NavigationBar_Height - Adaptive(20)) / 2,
                                         viewWidth - Adaptive(200),
                                         Adaptive(20));
        titleLabel.text          = title;
        titleLabel.textAlignment = 1;
        titleLabel.font          = [UIFont fontWithName:FONT_BOLD size:Adaptive(18)];
        [self addSubview:titleLabel];
    }
    return self;
}



- (void)backButtonClick:(UIButton *)button {
    
    switch (navigationStyle) {
        case SHNavgationStyleLastView:
        {
            [viewController.navigationController popViewControllerAnimated:YES];
        }
            break;
        case SHNavgationStyleRootView:
        {
            [viewController.navigationController popToRootViewControllerAnimated:YES];
        }
            break;
            
        default:
            break;
    }
    
}


@end
