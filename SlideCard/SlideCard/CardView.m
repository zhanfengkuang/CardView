//
//  CardView.m
//  SlideCard
//
//  Created by 邝战锋 on 2017/7/18.
//  Copyright © 2017年 Maple. All rights reserved.
//

#import "CardView.h"

#define kScrollViewWidth 0
#define kScrollViewHeight 2

@interface CardView () <UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) NSMutableArray *cardsArray;
@property (nonatomic, assign) NSInteger numberOfCards;
@end

@implementation CardView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _cardsArray = [NSMutableArray array];
        [self setup];
    }
    return self;
}

- (void)setup {
    _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    _scrollView.delegate = self;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.pagingEnabled = YES;
    _scrollView.backgroundColor = [UIColor blueColor];
    _scrollView.contentInset = UIEdgeInsetsMake(20, 20, 20, 20);
    [self addSubview:_scrollView];
}

- (void)loadCard {
    for (UIView *card in _cardsArray) {
        [card removeFromSuperview];
    }
    _numberOfCards = [_dataSource numberOfCards];
    if (_numberOfCards == 0) {
        return;
    }
    
    _scrollView.contentSize = CGSizeMake(kScrollViewWidth * _numberOfCards, kScrollViewHeight);
    _scrollView.contentOffset = [self contentOffsetWithindex:0];
    for (NSInteger i = 0; i < _numberOfCards; i++) {
        if ([_dataSource respondsToSelector:@selector(viewOfIndex:)]) {
            UIView *card = [_dataSource viewOfIndex:i];
            card.center = CGPointMake(kScrollViewWidth * i + kScrollViewWidth / 2, kScrollViewHeight / 2);
            card.backgroundColor = [UIColor redColor];
            card.tag = i;
            [_scrollView addSubview:card];
        }
    }
}

- (CGPoint)contentOffsetWithindex:(NSInteger)index {
    return CGPointMake(kScrollViewWidth * index, 0);
}

- (NSInteger)currentIndex {
    return _scrollView.contentOffset.x / kScrollViewWidth;
}

@end






















