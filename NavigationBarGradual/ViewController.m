//
//  ViewController.m
//  NavigationBarGradual
//
//  Created by Alex on 16/5/18.
//  Copyright © 2016年 Alex. All rights reserved.
//

#import "ViewController.h"
#import "UINavigationBar+Background.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentViewHeightConstraint;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *scrollTopConstraint;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.navigationController.navigationBar cnSetBackgroundColor:[UIColor clearColor]];

    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor clearColor]}];

}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    _contentViewHeightConstraint.constant = 700;
    _scrollTopConstraint.constant = -64;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar cnReset];
}

#pragma mark UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    UIColor *color = [UIColor colorWithRed:235/255.0 green:95/255.0 blue:109/255.0 alpha:1];
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY >=  5) {
        CGFloat alpha = MIN(1, offsetY/64);
        [self.navigationController.navigationBar cnSetBackgroundColor:[color colorWithAlphaComponent:alpha]];
        
        [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    }
    else
    {
        [self.navigationController.navigationBar cnSetBackgroundColor:[color colorWithAlphaComponent:0]];
        
        [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor clearColor]}];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
