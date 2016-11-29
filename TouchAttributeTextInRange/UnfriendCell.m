
//
//  UnfriendCell.m
//  iMyLife
//
//  Created by wuxue on 16/8/23.
//  Copyright © 2016年 Andon. All rights reserved.
//

#import "UnfriendCell.h"

@interface UnfriendCell ()

@property(nonatomic, strong) NSArray* matches;

@end
@implementation UnfriendCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.msgLabel.text = @"你现在不是他（她）的好友，现在发送好友验证，对方验证通过后，才可聊天。";
    self.bgView.layer.cornerRadius =10;
    self.bgView.layer.masksToBounds = YES;
    self.msgLabel.delegate = self;
    
    NSError *error = NULL;
    NSDataDetector *detector = [NSDataDetector dataDetectorWithTypes:NSTextCheckingTypeLink error:&error];
    
    self.matches = [detector matchesInString:self.msgLabel.text options:0 range:NSMakeRange(0, self.msgLabel.text.length)];
    
    [self highlightLinksWithIndex:NSNotFound];
}

#pragma mark -

- (void)label:(PPLabel *)label didBeginTouch:(UITouch *)touch onCharacterAtIndex:(CFIndex)charIndex {
    
    [self highlightLinksWithIndex:charIndex];
}

- (void)label:(PPLabel *)label didMoveTouch:(UITouch *)touch onCharacterAtIndex:(CFIndex)charIndex {
    
    [self highlightLinksWithIndex:charIndex];
}

- (void)label:(PPLabel *)label didEndTouch:(UITouch *)touch onCharacterAtIndex:(CFIndex)charIndex {
    
    [self highlightLinksWithIndex:NSNotFound];
    
    for (NSTextCheckingResult *match in self.matches) {
        
        
        if (match.range.length == 10 &&match.range.location ==10) {
            NSLog(@"==yes");
        }
        if ([match resultType] == NSTextCheckingTypeLink) {
            
            NSRange matchRange = [match range];
            
            if ([self isIndex:charIndex inRange:matchRange]) {
                
                NSLog(@"==");
                break;
            }
        }
    }
    
}

- (void)label:(PPLabel *)label didCancelTouch:(UITouch *)touch {
    
    [self highlightLinksWithIndex:NSNotFound];
}

#pragma mark -

- (BOOL)isIndex:(CFIndex)index inRange:(NSRange)range {
    return index > range.location && index < range.location+range.length;
}

- (void)highlightLinksWithIndex:(CFIndex)index {
    
    NSMutableAttributedString* attributedString = [self.msgLabel.attributedText mutableCopy];
    
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:NSMakeRange(15, 6)];
    
    self.msgLabel.attributedText = attributedString;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CFIndex touchIndex =  [self.msgLabel characterIndexAtPoint:[touch locationInView:self.msgLabel]];
    // 单向好友提示信息;
    if ((touchIndex-1) >= self.attRange.location &&(touchIndex-1)<= (self.attRange.location + self.attRange.length)) {
        self.blueTextTouchBlock();
        NSLog(@"%ld==%ld",touchIndex,self.attRange.location);
    }
}
@end
