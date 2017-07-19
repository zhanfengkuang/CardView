//
//  ViewController.m
//  SlideCard
//
//  Created by 邝战锋 on 2017/7/18.
//  Copyright © 2017年 Maple. All rights reserved.
//

#import "ViewController.h"
#import "CardView.h"

@interface ViewController ()
@property (nonatomic, strong) CardView *cardView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setup];
}

#pragma mark - initialization
- (void)setup {
    _cardView = [[CardView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width - 2, self.view.bounds.size.height - 2)];
    [self.view addSubview:_cardView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
