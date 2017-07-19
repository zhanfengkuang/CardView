//
//  ViewController.m
//  SlideCard
//
//  Created by 邝战锋 on 2017/7/18.
//  Copyright © 2017年 Maple. All rights reserved.
//

#import "ViewController.h"
#import "CardView.h"

#define kCardRatio 0.7
#define kCardWidth self.view.frame.size.width * kCardRatio
#define kCardHeight kCardWidth / kCardRatio

@interface ViewController () <CardViewDataSource>
@property (nonatomic, strong) CardView *cardView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setup];
}

#pragma mark - initialization
- (void)setup {
    _cardView = [[CardView alloc] initWithFrame:CGRectMake(0, 200, self.view.bounds.size.width, 280)];
    _cardView.dataSource = self;
    [_cardView loadCard];
    [self.view addSubview:_cardView];
}

#pragma mark - CardViewDataSource
- (NSInteger)numberOfCards {
    return 10;
}

- (UIView *)viewOfIndex:(NSInteger)index {
    UIView *card = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 250, kCardHeight)];
    card.backgroundColor = [UIColor redColor];
    return card;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
