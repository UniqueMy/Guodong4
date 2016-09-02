//
//  ClassTableView.m
//  Guodong4
//
//  Created by mac on 16/9/2.
//  Copyright © 2016年 Hao Sheng. All rights reserved.
//

#import "ClassTableView.h"
#import "ClassTableHeadView.h"
@interface ClassTableView ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView  *tableView;

@end

@implementation ClassTableView


#pragma mark -- 懒加载
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
    }
    return self;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    ClassTableHeadView *headView = [[ClassTableHeadView alloc] init];
    
    return headView;
    
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return Adaptive(165);
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    CGFloat sectionHeaderHeight = Adaptive(165);//设置你header高度
    if (scrollView.contentOffset.y<=sectionHeaderHeight&&scrollView.contentOffset.y>=0) {
        scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
    } else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
        scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
    }
    
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
