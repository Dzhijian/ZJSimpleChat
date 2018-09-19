//
//  AppDelegate.m
//  ZJSimpleChat
//
//  Created by 邓志坚 on 2018/9/18.
//  Copyright © 2018年 邓志坚. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+ZJRootController.h"
#import "AppDelegate+ZJHyphenate.h"

static NSString *AppKey = @"1195170417178669#simplechat";

@interface AppDelegate ()

@end

@implementation AppDelegate

/**
 *  获取当前对象实例
 *
 *  @return 返回 AppDelegate对象
 */
+ (AppDelegate *)sharedInstance
{
    AppDelegate *deleage = (AppDelegate *)[UIApplication sharedApplication].delegate;
    return deleage;
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    EMOptions *options = [EMOptions optionsWithAppkey:AppKey];
    options.apnsCertName = @"istore_dev";
    // 设置g环信代理
    [self zj_setHyphenateDelegate];

    [[EMClient sharedClient] initializeSDKWithOptions:options];
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    // 配置根控制器
    [self zj_configRootController];
    
    [self.window makeKeyAndVisible];
    return YES;
}


#pragma mark - 监听是否自动登录
- (void)autoLoginDidCompleteWithError:(EMError *)aError{
   
}


// APP进入后台
- (void)applicationDidEnterBackground:(UIApplication *)application
{
    [[EMClient sharedClient] applicationDidEnterBackground:application];
}

// APP将要从后台返回
- (void)applicationWillEnterForeground:(UIApplication *)application
{
    [[EMClient sharedClient] applicationWillEnterForeground:application];
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
