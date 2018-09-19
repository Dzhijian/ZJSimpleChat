//
//  ZJLoginViewController.m
//  ZJSimpleChat
//
//  Created by 邓志坚 on 2018/9/19.
//  Copyright © 2018年 邓志坚. All rights reserved.
//

#import "ZJLoginViewController.h"
#import "AppDelegate.h"
#import "AppDelegate+ZJRootController.h"
@interface ZJLoginViewController ()

@property (nonatomic, strong) UITextField *userTF;

@property (nonatomic, strong) UITextField *pwdTF;

@property (nonatomic, strong) UIButton *loginBtn;

@end

@implementation ZJLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"登录";
    self.view.backgroundColor = kRGBColor(220, 220, 220);
    [self setUpALlView];
    
    
}

-(void)loginBtnAction:(UIButton *)sender{
    
    [[EMClient sharedClient] loginWithUsername:self.userTF.text
                                      password:self.pwdTF.text
                                    completion:^(NSString *aUsername, EMError *aError) {
                                        if (!aError) {
                                            // 设置自动登录
                                            [[EMClient sharedClient].options setIsAutoLogin:YES];
                                            // 跳转到首页
                                            [[AppDelegate sharedInstance] zj_setMainController];
                                            NSLog(@"登录成功");
                                        } else {
                                            NSLog(@"登录失败");
                                        }
                                    }];
}


-(void)setUpALlView{
    
    self.userTF = [[UITextField alloc]init];
    self.userTF.font = [UIFont systemFontOfSize:14];
    self.userTF.textColor = [UIColor blackColor];
    self.userTF.borderStyle = UITextBorderStyleRoundedRect;
    self.userTF.placeholder = @"请输入用户名";
    self.userTF.keyboardType = UIKeyboardTypeDefault;
    [self.view addSubview:self.userTF];
    [self.userTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.centerY.equalTo(self.view.mas_centerY).offset(-130);
        make.width.mas_equalTo(250);
        make.height.mas_equalTo(50);
    }];
   
    self.pwdTF = [[UITextField alloc]init];
    self.pwdTF.font = [UIFont systemFontOfSize:14];
    self.pwdTF.textColor = [UIColor blackColor];
    self.pwdTF.borderStyle = UITextBorderStyleRoundedRect;
    self.pwdTF.placeholder = @"请输入密码";
    [self.view addSubview:self.pwdTF];
    [self.pwdTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.userTF.mas_bottom).offset(20);
        make.centerX.equalTo(self.view.mas_centerX);
        make.width.mas_equalTo(250);
        make.height.mas_equalTo(50);
    }];
    
    self.loginBtn = [[UIButton alloc]init];
    [self.loginBtn setTitle:@"登录" forState:(UIControlStateNormal)];
    [self.loginBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    self.loginBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    self.loginBtn.backgroundColor = [UIColor orangeColor];
    self.loginBtn.layer.cornerRadius = 5;
    [self.view addSubview:self.loginBtn];
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.pwdTF.mas_bottom).offset(30);
        make.centerX.mas_equalTo(0);
        make.width.mas_equalTo(250);
        make.height.mas_equalTo(50);
    }];
    
    [self.loginBtn addTarget:self action:@selector(loginBtnAction:) forControlEvents:(UIControlEventTouchUpInside)];
}



@end
