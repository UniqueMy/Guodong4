//
//  ClassTableView.m
//  Guodong4
//
//  Created by mac on 16/9/2.
//  Copyright © 2016年 Hao Sheng. All rights reserved.
//

#define Head_Height Adaptive(160)

#import "ClassTableView.h"
#import "ClassTableHeadView.h"
#import "ClassModel.h"
@interface ClassTableView ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView        *tableView;
@property (nonatomic,strong) ClassTableHeadView *headView;
@property (nonatomic,strong) NSMutableArray     *bannerArray;
@property (nonatomic,strong) NSMutableArray     *classArray;


@end

@implementation ClassTableView


#pragma mark -- 懒加载

- (ClassTableHeadView *)headView {
    if (!_headView) {
        _headView       = [[ClassTableHeadView alloc] init];
        _headView.frame = CGRectMake(0, 0, viewWidth, Head_Height);
        
    }
    return _headView;
}

- (UITableView *)tableView {
    if (!_tableView) {
        
        CGRect frame = CGRectMake(0,
                                  0,
                                  viewWidth,
                                  viewHeight - Status_height - NavigationBar_Height - Tabbar_Height);
        _tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
        _tableView.delegate        = self;
        _tableView.dataSource      = self;
        _tableView.backgroundColor = BASECOLOR;
        _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        _tableView.separatorStyle  = UITableViewCellSeparatorStyleNone;
        [self addSubview:_tableView];
        
    }
    return _tableView;
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self tableView];
        
        
        ClassModel *classModel = [ClassModel sharedViewManager];
        [classModel setBannerModelWithReturnBlock:^(id Value) {
            
        } BannerImageBlock:^(id Value) {
            
        } Class:^(id Value) {
            NSLog(@"Class %@",Value);
        }];
        [classModel startRequest];
    }
    return self;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    return self.headView;
    
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return Head_Height;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellidentifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellidentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleSubtitle reuseIdentifier:cellidentifier];
        cell.backgroundColor = ORANGECOLOR;
    }
    
    return cell;
    
}


@end
