//
//  LocationView.m
//  Guodong4
//
//  Created by mac on 16/8/31.
//  Copyright © 2016年 Hao Sheng. All rights reserved.
//

#import "LocationView.h"
#import "LocationModel.h"
#import <CoreLocation/CLLocationManagerDelegate.h>
#import <CoreLocation/CoreLocation.h>
@interface LocationView ()<CLLocationManagerDelegate>
@property (nonatomic,strong) CLLocationManager *locationManager;
@property (nonatomic,strong) CLGeocoder        *geoCoder;

@property (nonatomic,strong) UIImageView       *topImageView;
@property (nonatomic,strong) UILabel           *locationLabel;
@property (nonatomic,strong) UIButton          *locationButton;

@end

@implementation LocationView



- (UIImageView *)topImageView {
    if (!_topImageView) {
        _topImageView       = [UIImageView new];
        _topImageView.frame = CGRectMake(-Adaptive(8), 0, Adaptive(16), Adaptive(16.5));
        _topImageView.image = [UIImage imageNamed:@"shouye_dingwei1"];
        [self addSubview:_topImageView];
    }
    return _topImageView;
}

- (UILabel *)locationLabel {
    if (!_locationLabel) {
        _locationLabel       = [UILabel new];
        _locationLabel.frame = CGRectMake(CGRectGetMaxX(self.topImageView.frame) + Adaptive(3),
                                          Adaptive(6),
                                          Adaptive(90),
                                          Adaptive(15));
        _locationLabel.font      = [UIFont fontWithName:FONT size:Adaptive(14)];
        _locationLabel.textColor = BASECOLOR;
        _locationLabel.text      = @"定位中";
        [self addSubview:_locationLabel];
    }
    return _locationLabel;
}

- (UIButton *)locationButton {
    if (!_locationButton) {
        _locationButton       = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _locationButton.frame = CGRectMake(-Adaptive(10), Adaptive(3), Adaptive(90), Adaptive(20));
        [_locationButton addTarget:self action:@selector(cityViewClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_locationButton];
    }
    return _locationButton;
}
#pragma mark -- 初始化模块
- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [self createUI];
        
    }
    return self;
}

- (void)createUI {
    
    [self locationLabel];
    [self locationButton];
    
    UIImageView *buttomImageView = [UIImageView new];
    buttomImageView.frame        = CGRectMake(-Adaptive(8),
                                              CGRectGetMaxY(self.topImageView.frame) - Adaptive(3),
                                              Adaptive(16),
                                              Adaptive(7));
    buttomImageView.image        = [UIImage imageNamed:@"shouye_dingwei2"];
    [self addSubview:buttomImageView];
    
    LocationModel *locationModel = [LocationModel new];
    [locationModel startLocation];
    
   
//        NSLog(@"开始定位");
//        if ([CLLocationManager locationServicesEnabled] &&
//            ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedAlways
//             || [CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedWhenInUse)) {
//                //定位功能可用，开始定位
//                NSLog(@"开始");
//                _locationManager = [[CLLocationManager alloc] init];
//                
//                //创建并初始化编码器
//                _geoCoder = [[CLGeocoder alloc] init];
//                
//                //设置代理
//                _locationManager.delegate = self;
//                
//                //启动跟踪定位
//                [_locationManager startUpdatingLocation];
//                
//            } else {
//                NSLog(@"未开启定位");
//            }
//        
    
    

    
    
}
//#pragma mark - CoreLocation
//#pragma mark 跟踪定位代理方法，每次位置发生变化即会执行（只要定位到相应位置）
//- (void)locationManager:(CLLocationManager*)manager didUpdateLocations:(NSArray*)locations {
//    
//    //如果不需要实时定位，使用完即使关闭定位服务
//    [self.locationManager stopUpdatingLocation];
//    CLLocation* location = [locations firstObject]; //取出第一个位置
//    
//    NSDictionary *locationDict = @{ @"lnt" : [NSString stringWithFormat:@"%f", location.coordinate.longitude],@"lat" : [NSString stringWithFormat:@"%f", location.coordinate.latitude]};
//    
//    NSLog(@"locationDict %@",locationDict);
//}

- (void)startAnimation {
    CABasicAnimation* basic =
    [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    basic.fromValue   = [NSNumber numberWithFloat:0];
    basic.byValue     = [NSNumber numberWithFloat:M_PI * 2];
    basic.repeatCount = 10000;
    basic.duration    = 1.5;
    [self.topImageView.layer addAnimation:basic forKey:@"basic"];
}

- (void)cityViewClick:(UIButton *)button {
    NSLog(@"点击了按钮");
}
@end
