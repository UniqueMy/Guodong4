//
//  LocationModel.m
//  Guodong4
//
//  Created by mac on 16/8/31.
//  Copyright © 2016年 Hao Sheng. All rights reserved.
//

#import "LocationModel.h"
#import <CoreLocation/CLLocationManagerDelegate.h>
#import <CoreLocation/CoreLocation.h>

@interface LocationModel ()<CLLocationManagerDelegate>

@property (nonatomic,strong) CLLocationManager *locationManager;
@property (nonatomic,strong) CLGeocoder        *geoCoder;

@end


@implementation LocationModel

#pragma mark -- 各类控件的懒加载
//- (CLLocationManager *)locationManager {
//    if (!_locationManager) {
//        _locationManager           = [CLLocationManager new];
//         _locationManager.delegate = self;
//    }
//   
//    return _locationManager;
//}
//
//- (CLGeocoder *)geoCoder {
//    if (!_geoCoder) {
//        _geoCoder = [CLGeocoder new];
//    }
//    return _geoCoder;
//}


- (void)startLocation {
    NSLog(@"开始定位");
    if ([CLLocationManager locationServicesEnabled] &&
        ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedAlways
         || [CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedWhenInUse)) {
            //定位功能可用，开始定位
            NSLog(@"开始");
            _locationManager = [[CLLocationManager alloc] init];
            
            //创建并初始化编码器
            _geoCoder = [[CLGeocoder alloc] init];
            
            //设置代理
            _locationManager.delegate = self;
            [_locationManager requestWhenInUseAuthorization];
            //启动跟踪定位
            [_locationManager startUpdatingLocation];
          
        } else {
            NSLog(@"未开启定位");
        }
    
}

#pragma mark - CoreLocation
#pragma mark 跟踪定位代理方法，每次位置发生变化即会执行（只要定位到相应位置）
- (void)locationManager:(CLLocationManager*)manager didUpdateLocations:(NSArray*)locations {
    
    //如果不需要实时定位，使用完即使关闭定位服务
    [_locationManager stopUpdatingLocation];
    CLLocation* location = [locations firstObject]; //取出第一个位置
    
    NSDictionary *locationDict = @{ @"lnt" : [NSString stringWithFormat:@"%f", location.coordinate.longitude],@"lat" : [NSString stringWithFormat:@"%f", location.coordinate.latitude]};
    
    NSLog(@"locationDict %@",locationDict);
}


@end
