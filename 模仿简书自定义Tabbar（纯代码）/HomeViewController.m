//
//  HomeViewController.m
//  模仿简书自定义Tabbar（纯代码）
//
//  Created by 纵昂 on 2017/2/23.
//  Copyright © 2017年 纵昂. All rights reserved.
//

#import "HomeViewController.h"
#import "TestViewController.h"
@implementation HomeViewController
- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"发现";
    
    UIButton *button = [UIButton new];
    [button setTitle:@"这里是首页" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:20];
    button.frame = CGRectMake( 100, 100, 200, 40);
    [button addTarget:self action:@selector(clickButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)clickButton{
    [self.navigationController pushViewController:[[TestViewController alloc] init] animated:YES];
}
@end
