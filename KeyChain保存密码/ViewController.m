//
//  ViewController.m
//  KeyChain保存密码
//
//  Created by cxs on 2018/6/26.
//  Copyright © 2018年 cxs. All rights reserved.
//

#import "ViewController.h"
#import "SSKeychain.h"
#define LDLoginServiceName @"LDLoginServiceName"
#define LDLoginUserName @"LDLoginUserName"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwardTextField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadUserInfo];
}

- (IBAction)login:(id)sender {
    if ([self.userNameTextField.text length] <= 0 || [self.passwardTextField.text length] <= 0) {
        return;
    }
    //登录网络请求省略
    //登录成功保存账号密码
    [self savePwdWithAccunt:self.userNameTextField.text Pwd:self.passwardTextField.text];
}

//加载本地用户信息
-(void)loadUserInfo{
    //加载账号
    self.userNameTextField.text = [[NSUserDefaults standardUserDefaults] stringForKey:LDLoginUserName];
    //找出所有的账号
    self.passwardTextField.text = [SSKeychain passwordForService:LDLoginServiceName account:self.userNameTextField.text];
}



//保存账号密码
-(void)savePwdWithAccunt:(NSString *)accunt Pwd:(NSString *)pwd{
    //保存账号
    [[NSUserDefaults standardUserDefaults] setObject:accunt forKey:LDLoginUserName];
    //同步 -- 立刻马上保存!
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    //保存密码
    /**
     *  参数
     *  1. 密码明文
     *  2. 服务,符合和账号一起来唯一的表示一个密码
     *  3. 账号,用户名
     */
    [SSKeychain setPassword:pwd forService:LDLoginServiceName account:accunt];
}


@end
