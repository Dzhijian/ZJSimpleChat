//
//  AppDelegate+ZJHyphenate.m
//  ZJSimpleChat
//
//  Created by 邓志坚 on 2018/9/19.
//  Copyright © 2018年 邓志坚. All rights reserved.
//

#import "AppDelegate+ZJHyphenate.h"

@implementation AppDelegate (ZJHyphenate)

-(void)zj_setHyphenateDelegate{
    
    // 设置代理
    [[EMClient sharedClient] addDelegate:self delegateQueue:kMainThread];
    
}

#pragma mark - 自动重连

//自动登录完成时的回调
- (void)autoLoginDidCompleteWithError:(EMError *)aError{
    
}


@end
