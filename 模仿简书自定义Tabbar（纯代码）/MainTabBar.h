//
//  MainTabBar.h
//  模仿简书自定义Tabbar（纯代码）
//
//  Created by 纵昂 on 2017/2/23.
//  Copyright © 2017年 纵昂. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MainTabBar;

@protocol MainTabBarDelegate <NSObject>

@optional
- (void)tabBar:(MainTabBar *)tabBar didSelectedButtonFrom:(long)fromBtnTag to:(long)toBtnTag;
- (void)tabBarClickWriteButton:(MainTabBar *)tabBar;
@end

@interface MainTabBar : UIView
- (void)addTabBarButtonWithTabBarItem:(UITabBarItem *)tabBarItem;
@property(nonatomic, weak)id <MainTabBarDelegate>delegate;

@end
