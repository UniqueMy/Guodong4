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
#import "ClassTableViewCell.h"
@interface ClassTableView ()<UITableViewDelegate,UITableViewDataSource,ClassTableHeadDelegate>

@property (nonatomic,strong) UITableView        *tableView;
@property (nonatomic,strong) ClassTableHeadView *headView;
@property (nonatomic,strong) NSArray            *classArray;
@property (nonatomic,strong) NSDictionary       *chargeDict;

@end

@implementation ClassTableView
{
    NSString *ClassOrShop;
}
#pragma mark -- 懒加载

- (ClassTableHeadView *)headView {
    if (!_headView) {
        _headView          = [[ClassTableHeadView alloc] init];
        _headView.frame    = CGRectMake(0, 0, viewWidth, Head_Height);
        _headView.delegate = self;
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
        _tableView.showsVerticalScrollIndicator = NO;
        [self addSubview:_tableView];
        
    }
    return _tableView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
       
        [self tableView];
        // 默认类型为课程
        ClassOrShop = @"Class";
    }
    return self;
}

#pragma mark -- ClassTableHeadDelegate

- (void)getClassModelByTableHeadWithValue:(NSArray *)value dict:(NSDictionary *)dict{
    ClassOrShop = @"Class";
    _classArray = value;
    _chargeDict = dict;
    [self.tableView reloadData];
}

- (void)getShopValueByTableHeadWithValue:(NSArray *)value {
    ClassOrShop = @"Shop";
    _classArray = value;
    [self.tableView reloadData];
}

#pragma mark -- UITableViewDelegate

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    return self.headView;
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return Head_Height;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger count;
    count = [ClassOrShop isEqualToString:@"Class"] ? _classArray.count + 2 : _classArray.count + 1;
    return count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([ClassOrShop isEqualToString:@"Class"]) {
        if (indexPath.row == _classArray.count + 1) {
            return Adaptive(20);
        } else {
            return Adaptive(125);
        }
    } else {
        if (indexPath.row == _classArray.count) {
            return Adaptive(20);
        } else {
            return Adaptive(125);
        }
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 根据是课程还是体验店判断cell类型
    
    if ([ClassOrShop isEqualToString:@"Class"]) {
        // 课程
        if (indexPath.row == 0) {
            // 充值套餐
            
            static NSString *celllastidentifier = @"ChargeCell";
            
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:celllastidentifier];
            if (cell == nil) {
                
                cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleSubtitle reuseIdentifier:celllastidentifier];
                cell.selectionStyle  = UITableViewCellSelectionStyleNone;
                cell.backgroundColor = BASECOLOR;
            }
            
            UILabel *line = [UILabel new];
            line.frame    = CGRectMake(0, 0, viewWidth, Adaptive(5));
            line.backgroundColor = BASECOLOR;
            [cell addSubview:line];
            
            UIImageView *contentImageView = [UIImageView new];
            contentImageView.frame        = CGRectMake(0, CGRectGetMaxY(line.frame), viewWidth, Adaptive(120));
            [contentImageView sd_setImageWithURL:[NSURL URLWithString:[_chargeDict objectForKey:@"charge_img"]]];
            [cell addSubview:contentImageView];
            
            return cell;
            
        } else if (indexPath.row  == _classArray.count + 1) {
            // 最后一行 介绍
            
            static NSString *celllastidentifier = @"ClassLastcell";
            
            LeftLastCell *cell = [tableView dequeueReusableCellWithIdentifier:celllastidentifier];
            if (cell == nil) {
                cell = [[LeftLastCell alloc] initWithStyle: UITableViewCellStyleSubtitle reuseIdentifier:celllastidentifier];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
            }
             cell.moreLabel.text = @"更多课程研发中...";
            return cell;
        
        } else {
            
            static NSString *cellidentifier = @"ClassCell";
            
            ClassTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellidentifier];
            if (cell == nil)
            {
                cell = [[ClassTableViewCell alloc] initWithStyle: UITableViewCellStyleSubtitle reuseIdentifier:cellidentifier];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
            }
            ClassPublicModel *publicModel = _classArray[indexPath.row - 1];
            cell.publicModel              = publicModel;
            
            return cell;
        }
    } else {
        // 体验店
        if (indexPath.row  == _classArray.count) {
            // 最后一行
            // 最后一行 介绍
            
            static NSString *celllastidentifier = @"ShopLastcell";
            
            LeftLastCell *cell = [tableView dequeueReusableCellWithIdentifier:celllastidentifier];
            if (cell == nil) {
                cell = [[LeftLastCell alloc] initWithStyle: UITableViewCellStyleSubtitle reuseIdentifier:celllastidentifier];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
            }
            cell.moreLabel.text = @"我们正在努力扩建中...";
            return cell;
            
        } else {
        
            static NSString *cellidentifier = @"ShopCell";
            
            ShopTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellidentifier];
            if (cell == nil)
            {
                cell = [[ShopTableViewCell alloc] initWithStyle: UITableViewCellStyleSubtitle reuseIdentifier:cellidentifier];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
            }
            ClassPublicModel *publicModel = _classArray[indexPath.row];
            cell.publicModel              = publicModel;
        
            return cell;
            
        }
    }
}

@end
