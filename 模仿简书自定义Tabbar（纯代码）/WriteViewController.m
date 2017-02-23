//
//  WriteViewController.m
//  模仿简书自定义Tabbar（纯代码）
//
//  Created by 纵昂 on 2017/2/23.
//  Copyright © 2017年 纵昂. All rights reserved.
//

#import "WriteViewController.h"

@implementation WriteViewController
- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"写文章";
    
    // 设置导航条的按钮
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"关闭" style:UIBarButtonItemStylePlain target:self action:@selector(clickLeftBatButton)];
    self.navigationItem.leftBarButtonItem = backButton;
}

- (void)clickLeftBatButton{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
