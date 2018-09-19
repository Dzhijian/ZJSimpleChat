//
//  AppDelegate+ZJRootController.m
//  ZJSimpleChat
//
//  Created by 邓志坚 on 2018/9/19.
//  Copyright © 2018年 邓志坚. All rights reserved.
//

#import "AppDelegate+ZJRootController.h"
#import "ZJLoginViewController.h"
#import "ZJTabBarController.h"
#import "ZJNavigationController.h"


@implementation AppDelegate (ZJRootController)

/**
 配置根控制器
 */
- (void)zj_configRootController{
    if ([EMClient sharedClient].isAutoLogin) {
        [self zj_setMainController];
    }else{
        [self zj_presentLoginController];
    }
    
}


/**
 弹出登录控制器
 */
- (void)zj_presentLoginController{
    ZJLoginViewController *login = [[ZJLoginViewController alloc]init];
    ZJNavigationController *nav = [[ZJNavigationController alloc]initWithRootViewController:login];
    [AppDelegate sharedInstance].window.rootViewController = nav;
}
/**
 *  主控制器
 */
-(void)zj_setMainController{
    [AppDelegate sharedInstance].window.rootViewController = [[ZJTabBarController alloc]init];
}
@end
