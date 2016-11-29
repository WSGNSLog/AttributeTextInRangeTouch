//
//  UnfriendCell.h
//  iMyLife
//
//  Created by wsg on 16/8/23.
//  Copyright © 2016年 Andon. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "PPLabel.h"
//蓝色字点击
typedef void(^UnfriendMessageBlueTextTouch)();

@interface UnfriendCell : UITableViewCell<PPLabelDelegate>
@property (weak, nonatomic) IBOutlet PPLabel *msgLabel;

@property (weak, nonatomic) IBOutlet UIView *bgView;

// 属性String;
@property (nonatomic, strong) NSMutableAttributedString *attText;
@property (nonatomic, assign) NSRange attRange;

@property (nonatomic,copy)UnfriendMessageBlueTextTouch blueTextTouchBlock;
@end
