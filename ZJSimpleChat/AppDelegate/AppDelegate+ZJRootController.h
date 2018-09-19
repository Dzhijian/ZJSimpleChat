//
//  AppDelegate+ZJRootController.h
//  ZJSimpleChat
//
//  Created by 邓志坚 on 2018/9/19.
//  Copyright © 2018年 邓志坚. All rights reserved.
//

#import "AppDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface AppDelegate (ZJRootController) 

/**
 配置根控制器
 */
- (void)zj_configRootController;
/**
 弹出登录控制器
 */
- (void)zj_presentLoginController;
/**
 *  主控制器
 */
-(void)zj_setMainController;

@end

NS_ASSUME_NONNULL_END
