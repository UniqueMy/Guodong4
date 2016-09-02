//
//  CityViewController.m
//  Guodong4
//
//  Created by mac on 16/9/1.
//  Copyright © 2016年 Hao Sheng. All rights reserved.
//
#import "SHNavgationView.h"
#import "CityViewController.h"
#import "CityModel.h"
#import "CityHeadView.h"
#import "CityCell.h"
@interface CityViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) NSArray     *dataArray;
@property (nonatomic,strong) UITableView *tableView;

@end

@implementation CityViewController

#pragma mark -- 懒加载
- (UITableView *)tableView {
    if (!_tableView) {
        
        CGRect frame = CGRectMake(0,
                                  Status_height + NavigationBar_Height,
                                  viewWidth,
                                  viewHeight - Status_height - NavigationBar_Height);
        _tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
        _tableView.delegate        = self;
        _tableView.dataSource      = self;
        _tableView.backgroundColor = BASECOLOR;
        _tableView.rowHeight       = Adaptive(70);
        _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        _tableView.separatorStyle  = UITableViewCellSeparatorStyleNone;
        [self.view addSubview:_tableView];
        
    } 
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor           = BASECOLOR;
    self.tabBarController.tabBar.hidden = YES;
   
    
    SHNavgationView *navigation = [[SHNavgationView alloc] initWithTitle:@"当前城市" Style:SHNavgationStyleLastView Controller:self];
    [self.view addSubview:navigation];
    
    CityModel *cityModel = [[CityModel alloc] init];
    
    [cityModel setBlockWithReturnBlock:^(id Value) {
        
        _dataArray = Value;
        [self.tableView reloadData];
        
    }];
    [cityModel startRequest];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _dataArray.count;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    CityHeadView *headView = [[CityHeadView alloc] init];
   
    headView.cityName      = _cityName;
    return headView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return Adaptive(70);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"CityCell";
    
    CityCell *cityCell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cityCell == nil) {
        cityCell = [[CityCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    
    [cityCell setValueWithModel:_dataArray[indexPath.row]];
    return cityCell;
    
}
@end
