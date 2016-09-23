//
//  MainViewController.m
//  Guodong4
//
//  Created by mac on 16/8/30.
//  Copyright © 2016年 Hao Sheng. All rights reserved.
//

#import "MainViewController.h"

#import "ClassViewController.h"
#import "FinderViewController.h"
#import "PersonViewController.h"



@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    // 初始化一个tabBar控制器
    UITabBarController *tabbar    = [[UITabBarController alloc] init];
    [[UITabBar appearance] setBarTintColor:BASECOLOR]; // 修改背景颜色
    [[UITabBar appearance] setTintColor:ORANGECOLOR];  // 修改点击后的颜色
    
    
    ClassViewController *classVC     = [[ClassViewController alloc] init];
    classVC.tabBarItem.title         = @"课程";
    classVC.tabBarItem.image         = [UIImage imageNamed:@"tabbarGry_1"];
    classVC.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbarOrange_1"];
    
    
    FinderViewController *finderVC    = [[FinderViewController alloc] init];
    finderVC.tabBarItem.title         = @"发现";
    finderVC.tabBarItem.image         = [UIImage imageNamed:@"tabbarGry_2"];
    finderVC.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbarOrange_2"];
    
    PersonViewController *personVC    = [[PersonViewController alloc] init];
    personVC.tabBarItem.title         = @"个人";
    personVC.tabBarItem.image         = [UIImage imageNamed:@"tabbarGry_3"];
    personVC.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbarOrange_3"];
    
    
    
    UINavigationController *classNav  = [[UINavigationController alloc] initWithRootViewController:classVC];
    classNav.navigationBarHidden      = YES; // 隐藏导航栏 自定义导航栏
    
    UINavigationController *finderNav = [[UINavigationController alloc] initWithRootViewController:finderVC];
    finderNav.navigationBarHidden     = YES;
    
    UINavigationController *personNav = [[UINavigationController alloc] initWithRootViewController:personVC];
    personNav.navigationBarHidden     = YES;
    
    tabbar.viewControllers        = @[classNav,finderNav,personNav];
    app.window.rootViewController = tabbar;
    [app.window makeKeyAndVisible];
    
    
}



@end
