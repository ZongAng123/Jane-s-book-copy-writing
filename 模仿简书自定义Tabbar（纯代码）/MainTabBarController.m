//
//  MainTabBarController.m
//  模仿简书自定义Tabbar（纯代码）
//
//  Created by 纵昂 on 2017/2/23.
//  Copyright © 2017年 纵昂. All rights reserved.
//

#import "MainTabBarController.h"
#import "HomeViewController.h"
#import "MeViewController.h"
#import "NotificationViewController.h"
#import "SubscriptionViewController.h"
#import "WriteViewController.h"
#import "MainNavigationController.h"
#import "MainTabBar.h"

@interface MainTabBarController ()<MainTabBarDelegate>
@property(nonatomic, weak)MainTabBar *mainTabBar;
@property(nonatomic, strong)HomeViewController *homeVc;
@property(nonatomic, strong)SubscriptionViewController *subscriptionVc;
@property(nonatomic, strong)NotificationViewController *notificationVc;
@property(nonatomic, strong)MeViewController *meVc;
@end

@implementation MainTabBarController
- (void)viewDidLoad{
    [super viewDidLoad];
    
    [self SetupMainTabBar];
    [self SetupAllControllers];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    for (UIView *child in self.tabBar.subviews) {
        if ([child isKindOfClass:[UIControl class]]) {
            [child removeFromSuperview];
        }
    }
}

- (void)SetupMainTabBar{
    MainTabBar *mainTabBar = [[MainTabBar alloc] init];
    mainTabBar.frame = self.tabBar.bounds;
    mainTabBar.delegate = self;
    [self.tabBar addSubview:mainTabBar];
    _mainTabBar = mainTabBar;
}

- (void)SetupAllControllers{
    NSArray *titles = @[@"发现", @"关注", @"消息", @"我的"];
    NSArray *images = @[@"icon_tabbar_home~iphone", @"icon_tabbar_subscription~iphone", @"icon_tabbar_notification~iphone", @"icon_tabbar_me~iphone"];
    NSArray *selectedImages = @[@"icon_tabbar_home_active~iphone", @"icon_tabbar_subscription_active~iphone", @"icon_tabbar_notification_active~iphone", @"icon_tabbar_me_active~iphone"];
    
    HomeViewController * homeVc = [[HomeViewController alloc] init];
    self.homeVc = homeVc;
    
    SubscriptionViewController * subscriptionVc = [[SubscriptionViewController alloc] init];
    self.subscriptionVc = subscriptionVc;
    
    NotificationViewController * notificationVc = [[NotificationViewController alloc] init];
    self.notificationVc = notificationVc;
    
    MeViewController * meVc = [[MeViewController alloc] init];
    self.meVc = meVc;
    
    NSArray *viewControllers = @[homeVc, subscriptionVc, notificationVc, meVc];
    
    for (int i = 0; i < viewControllers.count; i++) {
        UIViewController *childVc = viewControllers[i];
        [self SetupChildVc:childVc title:titles[i] image:images[i] selectedImage:selectedImages[i]];
    }
}

- (void)SetupChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)imageName selectedImage:(NSString *)selectedImageName{
    MainNavigationController *nav = [[MainNavigationController alloc] initWithRootViewController:childVc];
    childVc.tabBarItem.image = [UIImage imageNamed:imageName];
    childVc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImageName];
    childVc.tabBarItem.title = title;
    [self.mainTabBar addTabBarButtonWithTabBarItem:childVc.tabBarItem];
    [self addChildViewController:nav];
}



#pragma mark --------------------mainTabBar delegate
- (void)tabBar:(MainTabBar *)tabBar didSelectedButtonFrom:(long)fromBtnTag to:(long)toBtnTag{
    self.selectedIndex = toBtnTag;
}

- (void)tabBarClickWriteButton:(MainTabBar *)tabBar{
    WriteViewController *writeVc = [[WriteViewController alloc] init];
    MainNavigationController *nav = [[MainNavigationController alloc] initWithRootViewController:writeVc];
    
    [self presentViewController:nav animated:YES completion:nil];
}

@end
