//
//  AppDelegate.h
//  ZJSimpleChat
//
//  Created by 邓志坚 on 2018/9/18.
//  Copyright © 2018年 邓志坚. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

/**
 *  获取当前对象实例
 *
 *  @return 返回 AppDelegate对象
 */
+ (AppDelegate *)sharedInstance;

@end

