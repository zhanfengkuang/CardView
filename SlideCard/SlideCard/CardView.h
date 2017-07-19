//
//  CardView.h
//  SlideCard
//
//  Created by 邝战锋 on 2017/7/18.
//  Copyright © 2017年 Maple. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CardViewDataSource <NSObject>

/**
 获取card的数量

 @return card number
 */
- (NSInteger)numberOfCards;

/**
 获取自定义card视图

 @param index 卡片索引
 @return card view
 */
- (UIView *)viewOfIndex:(NSInteger)index;

@end

@interface CardView : UIView

/**
 delegate
 */
@property (nonatomic, weak) id <CardViewDataSource> dataSource;

/**
 加载card
 */
- (void)loadCard;

/**
 返回所有cards

 @return cards
 */
- (NSArray *)allCards;


@end






