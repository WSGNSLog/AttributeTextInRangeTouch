


//
//  ChatController.m
//  tabletest
//
//  Created by wsg on 2016/11/28.
//  Copyright © 2016年 wsg. All rights reserved.
//

#import "ChatController.h"
#import "UnfriendCell.h"

@interface ChatController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@property(nonatomic,strong)NSMutableArray *dataSource;
@end
static NSString *const SenderCell = @"unfriendC";
@implementation ChatController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataSource = [NSMutableArray array];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath

{
    UnfriendCell * cell = [tableView dequeueReusableCellWithIdentifier:SenderCell];
    NSRange attRange;
    attRange.location = 15;
    attRange.length = 6;
    
    cell.attRange = attRange;
    cell.blueTextTouchBlock = ^(){
        //蓝色文字点击
        NSLog(@"😁👌😄😁");
    };
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)touchesShouldCancelInContentView:(UIView *)view{
    if ([view isKindOfClass:[UnfriendCell class]]) {
        return NO;
    }else{
        
        return YES;
    }
}

@end
