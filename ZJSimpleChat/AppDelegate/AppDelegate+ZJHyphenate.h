//
//  AppDelegate+ZJHyphenate.h
//  ZJSimpleChat
//
//  Created by 邓志坚 on 2018/9/19.
//  Copyright © 2018年 邓志坚. All rights reserved.
//

#import "AppDelegate.h"

NS_ASSUME_NONNULL_BEGIN



@interface AppDelegate (ZJHyphenate)<EMClientDelegate>

// 设置环信 delegate
-(void)zj_setHyphenateDelegate;


@end

NS_ASSUME_NONNULL_END
