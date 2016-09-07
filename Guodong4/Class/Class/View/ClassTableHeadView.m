//
//  ClassTableHeadView.m
//  Guodong4
//
//  Created by mac on 16/9/2.
//  Copyright © 2016年 Hao Sheng. All rights reserved.
//

#import "ClassTableHeadView.h"
#import "ClassModel.h"
#import "ClassPublicModel.h"
#import "SDCycleScrollView.h" // 第三方ScrollView

@interface ClassTableHeadView ()<UIScrollViewDelegate,SDCycleScrollViewDelegate>

@property (nonatomic,strong) NSMutableArray *bannnerImageArray;


@end

@implementation ClassTableHeadView
{
    SDCycleScrollView *bannerScroll;
    UIImageView *imageView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        
        ClassModel *classModel = [ClassModel sharedViewManager];
        [classModel setBannerModelWithReturnBlock:^(id Value) {
            
        } BannerImageBlock:^(id Value) {
            bannerScroll.imageURLStringsGroup = (NSArray *)Value;
        } Class:^(id Value) {
            
        }];
        
       [self createMainView];
    }
    return self;
}

- (void)createMainView {
    
    
    CGRect frame = CGRectMake(0,0,viewWidth,Adaptive(125));
    
    bannerScroll = [SDCycleScrollView cycleScrollViewWithFrame:frame delegate:self placeholderImage:nil];
   
    bannerScroll.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
    bannerScroll.pageControlStyle   = SDCycleScrollViewPageContolStyleAnimated;
    bannerScroll.autoScrollTimeInterval = 5.0;
    bannerScroll.backgroundColor = [UIColor greenColor];
    bannerScroll.userInteractionEnabled = YES;
    [self addSubview:bannerScroll];
    
    
}

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {
    
    NSLog(@"index %ld",(long)index);
}

@end
