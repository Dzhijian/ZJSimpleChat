//
//  ZJTabBarController.m
//  ZJSimpleChat
//
//  Created by 邓志坚 on 2018/9/19.
//  Copyright © 2018年 邓志坚. All rights reserved.
//  

#import "ZJTabBarController.h"
#import "ZJNavigationController.h"
#import "ZJHomeViewController.h"
#import "ZJProfileViewController.h"
#import "ZJFriendsViewController.h"

@interface ZJTabBarController ()

@end

@implementation ZJTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpChildVC:[[ZJHomeViewController alloc]init] title:@"首页"];
    [self setUpChildVC:[[ZJFriendsViewController alloc]init] title:@"好友"];
    [self setUpChildVC:[[ZJProfileViewController alloc]init] title:@"我的"];
    //背景颜色
    [self.tabBar setBarTintColor:[UIColor whiteColor]];
    
}

-(void)setUpChildVC:(UIViewController *)childVc title:(NSString *)title {
    childVc.title = title;
    ZJNavigationController *nav = [[ZJNavigationController alloc]initWithRootViewController:childVc];
    [self addChildViewController:nav];
}


@end
