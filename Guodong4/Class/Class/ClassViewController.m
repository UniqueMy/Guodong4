//
//  ClassViewController.m
//  Guodong4
//
//  Created by mac on 16/8/30.
//  Copyright © 2016年 Hao Sheng. All rights reserved.
//

#import "ClassViewController.h"
#import "LocationView.h"
@interface ClassViewController ()

@property (nonatomic,strong) UIView       *navigationView;
@property (nonatomic,strong) LocationView *locationView;

@end

@implementation ClassViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
     [self.locationView startAnimation];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNavigationView];
   
    
}


#pragma mark -- 懒加载
- (UIView *)navigationView {
    if (!_navigationView) {
        _navigationView                 = [UIView new];
        _navigationView.frame           = CGRectMake(0, 0, viewWidth, NavigationBar_Height + Status_height);
        _navigationView.backgroundColor = ORANGECOLOR;
        [self.view addSubview:_navigationView];
    }
    return _navigationView;
}

- (LocationView *)locationView {
    if (!_locationView) {
        _locationView       = [LocationView new];
        _locationView.frame = CGRectMake(Space_Width,
                                         Status_height + (NavigationBar_Height - Adaptive(20)) / 2,
                                         Adaptive(80),
                                         Adaptive(20));
        [self.navigationView addSubview:_locationView];
    }
    return _locationView;
}

#pragma mark -- 构建导航条
- (void)setNavigationView {
   
   
    
    UIImageView* titleImage = [UIImageView new];
    titleImage.frame        = CGRectMake((viewWidth - Adaptive(51.6)) / 2,
                                         Status_height + (NavigationBar_Height - Adaptive(27)) / 2,
                                         Adaptive(51.6),
                                         Adaptive(27));
    titleImage.image        = [UIImage imageNamed:@"shouye_titleImage"];
    [self.navigationView addSubview:titleImage];
    [self.view addSubview:_navigationView];
    
    UIButton *photoButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    photoButton.frame     = CGRectMake(viewWidth - Adaptive(32),
                                       Status_height + (NavigationBar_Height - Adaptive(19)) / 2,
                                       Adaptive(19),
                                       Adaptive(19));
    [photoButton setBackgroundImage:[UIImage imageNamed:@"shouye_photo"] forState:UIControlStateNormal];
    [photoButton addTarget:self action:@selector(telePhoneClick:) forControlEvents:UIControlEventTouchUpInside];
    [_navigationView addSubview:photoButton];
    
}

// 客服
- (void)telePhoneClick:(UIButton *)button {
    NSMutableString* str = [[NSMutableString alloc] initWithFormat:@"tel:%@",KEFU];
    UIWebView* callWebview = [[UIWebView alloc] init];
    
    [callWebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:str]]];
    
    [self.view addSubview:callWebview];
}
@end
