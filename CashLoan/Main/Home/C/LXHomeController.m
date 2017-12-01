//
//  LXHomeController.m
//  DNXB
//
//  Created by lixu on 2017/3/10.
//  Copyright © 2017年 dnxb. All rights reserved.
//

#import "LXHomeController.h"
#import "LXTestCollectionController.h"
#import "LXTestTableController.h"

@interface LXHomeController ()

@end

@implementation LXHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 100, 300, 40)];
    btn.centerX = self.view.centerX;
    btn.backgroundColor = [UIColor greenColor];
    [btn setTitle:@"LXTestCollectionViewController" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIButton *btn2 = [[UIButton alloc] initWithFrame:CGRectMake(0, 200, 300, 40)];
    btn2.centerX = self.view.centerX;
    btn2.backgroundColor = [UIColor greenColor];
    [btn2 setTitle:@"LXTestRequestController" forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(btnClicked2) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
}

- (void)btnClicked
{
    LXTestCollectionController *vc = [[LXTestCollectionController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)btnClicked2
{
    LXTestTableController *vc = [[LXTestTableController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
