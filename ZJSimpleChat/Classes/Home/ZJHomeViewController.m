//
//  ZJHomeViewController.m
//  ZJSimpleChat
//
//  Created by 邓志坚 on 2018/9/19.
//  Copyright © 2018年 邓志坚. All rights reserved.
//

#import "ZJHomeViewController.h"

static NSString *cellID = @"CellKeyID";
@interface ZJHomeViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *mainTable;

@end

@implementation ZJHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.mainTable];
    [self.mainTable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    [self getConversations];
}

#pragma mark - 获取所有会话
-(void)getConversations{
    NSArray *conversations = [[EMClient sharedClient].chatManager getAllConversations];
    NSLog(@"所有会话%@",conversations);
}

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
@end
