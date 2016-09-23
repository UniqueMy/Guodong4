//
//  ClassTableViewCell.h
//  Guodong4
//
//  Created by mac on 16/9/22.
//  Copyright © 2016年 Hao Sheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ClassPublicModel;

// 课程Cell
@interface ClassTableViewCell : UITableViewCell

@property (nonatomic,strong) UIImageView *backgroundImageView;
@property (nonatomic,strong) UILabel     *titleLabel;
@property (nonatomic,strong) UILabel     *classNumberLabel;

@property (nonatomic,strong) ClassPublicModel *publicModel;

@end

// 最后一行Cell
@interface LeftLastCell : UITableViewCell

@property (nonatomic,retain) UILabel *moreLabel;

@end

// 体验店Cell
@interface ShopTableViewCell : UITableViewCell

@property (nonatomic,strong) UIImageView *backgroundImageView;
@property (nonatomic,strong) UIView      *alphaView;
@property (nonatomic,strong) UILabel     *titleName;
@property (nonatomic,strong) UILabel     *branchName;


@property (nonatomic,strong) ClassPublicModel *publicModel;

@end
