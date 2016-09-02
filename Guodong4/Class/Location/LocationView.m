//
//  LocationView.m
//  Guodong4
//
//  Created by mac on 16/8/31.
//  Copyright © 2016年 Hao Sheng. All rights reserved.
//

#import "LocationView.h"
#import "LocationModel.h"

#import "ClassViewController.h"
#import "ClassPublicModel.h"

#import <CoreLocation/CLLocationManagerDelegate.h>
#import <CoreLocation/CoreLocation.h>

@interface LocationView ()<CLLocationManagerDelegate>
@property (nonatomic,strong) CLLocationManager *locationManager;
@property (nonatomic,strong) CLGeocoder        *geoCoder;

@property (nonatomic,strong) UIImageView       *topImageView;
@property (nonatomic,strong) UILabel           *locationLabel;
@property (nonatomic,strong) UIButton          *locationButton;

@property (nonatomic)        BOOL               locationStatus;

@end

@implementation LocationView
{
    ClassPublicModel *classPublicModel;
}
#pragma mark -- 各类控件的懒加载

- (UIImageView *)topImageView {
    if (!_topImageView) {
        _topImageView       = [[UIImageView alloc] init];
        _topImageView.frame = CGRectMake(-Adaptive(8), 0, Adaptive(16), Adaptive(16.5));
        _topImageView.image = [UIImage imageNamed:@"shouye_dingwei1"];
        [self addSubview:_topImageView];
    }
    return _topImageView;
}

- (UILabel *)locationLabel {
    if (!_locationLabel) {
        _locationLabel       = [[UILabel alloc] init];
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
        _locationButton.frame = CGRectMake(-Adaptive(10), 0, Adaptive(90), Adaptive(25));
        [_locationButton addTarget:self action:@selector(cityViewClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_locationButton];
    }
    return _locationButton;
}

- (CLLocationManager *)locationManager {
    if (!_locationManager) {
        _locationManager          = [[CLLocationManager alloc] init];
        _locationManager.delegate = self;
    }
    return _locationManager;
}

- (CLGeocoder *)geoCoder {
    if (!_geoCoder) {
        _geoCoder = [[CLGeocoder alloc] init];
    }
    return _geoCoder;
}
#pragma mark -- 初始化模块
- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [self createMainView];
        [self startLocation];
        
    }
    return self;
}

- (void)createMainView {
    
    [self locationLabel];
    [self locationButton];
    
    UIImageView *buttomImageView = [[UIImageView alloc] init];
    buttomImageView.frame        = CGRectMake(-Adaptive(8),
                                              CGRectGetMaxY(self.topImageView.frame) - Adaptive(3),
                                              Adaptive(16),
                                              Adaptive(7));
    buttomImageView.image        = [UIImage imageNamed:@"shouye_dingwei2"];
    [self addSubview:buttomImageView];
    
}

- (void)startLocation {
    
    if ([CLLocationManager locationServicesEnabled] &&
        ([CLLocationManager authorizationStatus]    == kCLAuthorizationStatusAuthorizedAlways
         || [CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedWhenInUse)) {
            //定位功能可用，开始定位
            [self.locationManager startUpdatingLocation];
            
        } else {
            // 未开启定位 请求用户授权
            [self.locationManager requestWhenInUseAuthorization];
        }
}
- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    
    switch (status) {
        case kCLAuthorizationStatusDenied:
        {
            // 拒绝授权
            self.locationLabel.text = @"定位失败";
            _locationStatus         = NO;
        }
            break;
            
        case kCLAuthorizationStatusAuthorizedWhenInUse:
        {
            // 允许定位
            [self.locationManager startUpdatingLocation];
        }
            break;
        default:
            break;
    }
    
}
#pragma mark - CoreLocation
#pragma mark 跟踪定位代理方法，每次位置发生变化即会执行（只要定位到相应位置）
- (void)locationManager:(CLLocationManager*)manager didUpdateLocations:(NSArray*)locations {
    
    // 如果不需要实时定位，使用完即使关闭定位服务
    // 能否设置定位时间
    
    CLLocation* location = [locations firstObject]; //取出第一个位置
    
    NSDictionary *locationDict = @{@"lnt" : [NSString stringWithFormat:@"%f",location.coordinate.longitude],
                                   @"lat" : [NSString stringWithFormat:@"%f",location.coordinate.latitude]};
    
    if ([locationDict count] != 0) {
        [self.locationManager stopUpdatingLocation];
        LocationModel *locationModel = [[LocationModel alloc] init];
        
        [locationModel setBlockWithReturnBlock:^(id returnValue) {
            
            classPublicModel          = returnValue;
            _locationStatus     = YES;
            _locationLabel.text = classPublicModel.now_CityName ? classPublicModel.now_CityName : @"定位中";
            
            if (classPublicModel.is_allowed) [self.topImageView.layer removeAllAnimations];
            
            NSDictionary *allowDict      = @{@"allow":[NSNumber numberWithBool:classPublicModel.is_allowed]};
            NSNotification *notification = [NSNotification notificationWithName:@"allow" object:nil userInfo:allowDict];
            [[NSNotificationCenter defaultCenter] postNotification:notification];
            
        }];
        
        [locationModel startRequestCityNameWithLocationDict:locationDict];
    }
}

- (void)startAnimation {
    
    if (!classPublicModel.is_allowed) {
        CABasicAnimation* basic =
        [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
        basic.fromValue   = [NSNumber numberWithFloat:0];
        basic.byValue     = [NSNumber numberWithFloat:M_PI * 2];
        basic.repeatCount = 10000;
        basic.duration    = 1.5;
        [self.topImageView.layer addAnimation:basic forKey:@"basic"];
    }
    
}

- (void)cityViewClick:(UIButton *)button {
    
    if (_locationStatus == NO) {
        
        NSString *message                  = @"定位服务未开启,我们需要通过您的地理位置信息获取您周边的服务范围,请进入系统［设置］> [隐私] > [定位服务]中打开开关，并允许使用定位服务";
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        UIAlertAction *sureAction   = [UIAlertAction actionWithTitle:@"前往" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            [self goToSystemSetView];
            
        }];
        
        [alertController addAction:cancelAction];
        [alertController addAction:sureAction];
        
        self.PresentViewController(alertController);
        
    } else {
        
        self.PushCityViewController(classPublicModel.now_CityName);
    }
}

- (void)goToSystemSetView {
    NSURL * url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
    
    if([[UIApplication sharedApplication] canOpenURL:url]) {
        
        NSURL*url =[NSURL URLWithString:UIApplicationOpenSettingsURLString];
        [[UIApplication sharedApplication] openURL:url];
    }
}

@end
