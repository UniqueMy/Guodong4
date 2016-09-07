//
//  ClassViewController.m
//  Guodong4
//
//  Created by mac on 16/8/30.
//  Copyright © 2016年 Hao Sheng. All rights reserved.
//

#import "ClassViewController.h"
#import "LocationView.h"
#import "CityViewController.h"
#import "ClassTableView.h"

@interface ClassViewController ()

@property (nonatomic,strong) UIView         *navigationView;
@property (nonatomic,strong) LocationView   *locationView;
@property (nonatomic,strong) ClassTableView *classView;
@property (nonatomic)        BOOL            allow;


@end

@implementation ClassViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    [self.locationView startAnimation];
    self.tabBarController.tabBar.hidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = BASECOLOR;
    
    // 构建导航条
    [self setNavigationView];
    
    // 构建主界面
    [self createMainView];
    
    __weak ClassViewController *class = self;
    
    // 模态提示框
    self.locationView.PresentViewController = ^(UIAlertController *alert) {
        
        [class presentViewController:alert animated:YES completion:nil];
    };
    
    // Push到CityViewController
    self.locationView.PushCityViewController = ^(NSString *city) {
        
        CityViewController *cityVC = [[CityViewController alloc] init];
        cityVC.cityName            = city;
        [class.navigationController pushViewController:cityVC animated:YES];
        
    };
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(allow:) name:@"allow" object:nil];
}


#pragma mark -- 懒加载
- (UIView *)navigationView {
    if (!_navigationView) {
        _navigationView                 = [[UIView alloc] init];
        _navigationView.frame           = CGRectMake(0, 0, viewWidth, NavigationBar_Height + Status_height);
        _navigationView.backgroundColor = ORANGECOLOR;
        [self.view addSubview:_navigationView];
    }
    return _navigationView;
}

- (LocationView *)locationView {
    if (!_locationView) {
        _locationView       = [[LocationView alloc] init];
        _locationView.frame = CGRectMake(Space_Width,
                                         Status_height + (NavigationBar_Height - Adaptive(20)) / 2,
                                         Adaptive(80),
                                         Adaptive(20));
        [self.navigationView addSubview:_locationView];
    }
    return _locationView;
}

- (ClassTableView *)classView {
    if (!_classView) {
        _classView       = [[ClassTableView alloc] init];
        _classView.frame = CGRectMake(0, Status_height + NavigationBar_Height,
                                      viewWidth,
                                      viewHeight - Status_height - NavigationBar_Height - Tabbar_Height);
        _classView.backgroundColor = BASECOLOR;
        [self.view addSubview:_classView];
    }
    return _classView;
}

#pragma mark -- 构建导航条
- (void)setNavigationView {
    
    UIImageView* titleImage = [[UIImageView alloc] init];
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

- (void)allow:(NSNotification *)notification {
    _allow = [[notification.userInfo objectForKey:@"allow"] boolValue];
    NSLog(@"_allow %d",_allow);
}

// 客服
- (void)telePhoneClick:(UIButton *)button {
    NSMutableString* str   = [[NSMutableString alloc] initWithFormat:@"tel:%@",KEFU];
    UIWebView* callWebview = [[UIWebView alloc] init];
    [callWebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:str]]];
    [self.view addSubview:callWebview];
}

#pragma mark -- 构建主界面
- (void)createMainView {
    
    [self classView];
    
}

@end
