//
//  ZJFriendsViewController.m
//  ZJSimpleChat
//
//  Created by 邓志坚 on 2018/9/19.
//  Copyright © 2018年 邓志坚. All rights reserved.
//

#import "ZJFriendsViewController.h"

static NSString *cellID = @"FriendCellKeyID";

@interface ZJFriendsViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *mainTable;

@end

@implementation ZJFriendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.mainTable];
    [self.mainTable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    // 获取好友列表数据
    [self getAllFriendsList];
    
}

#pragma mark - 获取所有好友
-(void)getAllFriendsList{
    EMError *error = nil;
    NSArray *userlist = [[EMClient sharedClient].contactManager getContactsFromServerWithError:&error];
    if (!error) {
        NSLog(@"获取成功 -- %@",userlist);
    }
}

#pragma mark - UITableViewDelegate,UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}


- (UITableView *)mainTable{
    if (!_mainTable) {
        _mainTable = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _mainTable.delegate = self;
        _mainTable.dataSource = self;
        _mainTable.backgroundColor = [UIColor whiteColor];
        _mainTable.rowHeight = 55;
        [_mainTable registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
        _mainTable.tableFooterView = [[UIView alloc]init];
        
    }
    return _mainTable;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
