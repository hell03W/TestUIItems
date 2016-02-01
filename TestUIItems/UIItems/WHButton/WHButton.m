//
//  WHButton.m
//  TestUIItems
//
//  Created by  www.6dao.cc on 16/1/5.
//  Copyright © 2016年 www.6dao.com. All rights reserved.
//

#import "WHButton.h"

@implementation WHButton

- (void)setButtonStyle:(WHButtonStyle)buttonStyle
{
    _buttonStyle = buttonStyle;
    [self setNeedsLayout];
}

- (NSInteger)subitemsSpace
{
    if (_subitemsSpace == 0) {
        return 5;
    }
    return _subitemsSpace;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    if (self.buttonStyle == WHButtonStyleImageLeft) {
        [self buttonStyleLeft];
    }
    else if (self.buttonStyle == WHButtonStyleImageTop){
        [self buttonStyleTop];
    }
    else if (self.buttonStyle == WHButtonStyleImageRight){
        [self buttonStyleRight];
    }
    else if (self.buttonStyle == WHButtonStyleImageBottom){
        [self buttonStyleBottom];
    }
    else if (self.buttonStyle == WHButtonStyleLeftAlignment){
        [self buttonStyleLeftAlignment];
    }

//    self.titleLabel.backgroundColor = [UIColor lightGrayColor];
//    self.imageView.backgroundColor = [UIColor redColor];
//    self.backgroundColor = [UIColor blackColor];
}

- (void)buttonStyleLeftAlignment
{
    NSInteger x = 5;
    // Center image
    CGPoint center = self.imageView.center;
    center.x = x + self.imageView.frame.size.width/2;
    self.imageView.center = center;
    
    //Center text
    CGRect newFrame = [self titleLabel].frame;
    newFrame.origin.x = CGRectGetMaxX(self.imageView.frame) + self.subitemsSpace;
    newFrame.origin.y = self.frame.size.height/2 - self.titleLabel.frame.size.height/2;
    self.titleLabel.frame = newFrame;
}

- (void)buttonStyleLeft
{
    NSInteger x = (self.frame.size.width - self.imageView.frame.size.width - self.titleLabel.frame.size.width - self.subitemsSpace) / 2;
    // Center image
    CGPoint center = self.imageView.center;
    center.x = x + self.imageView.frame.size.width/2;
    center.y = self.frame.size.height/2;
    self.imageView.center = center;
    
    //Center text
    CGRect newFrame = [self titleLabel].frame;
    newFrame.origin.x = CGRectGetMaxX(self.imageView.frame) + self.subitemsSpace;
    newFrame.origin.y = self.frame.size.height/2 - self.titleLabel.frame.size.height/2;
    self.titleLabel.frame = newFrame;
}
- (void)buttonStyleTop
{
    NSInteger y = (self.frame.size.height - self.imageView.frame.size.height - self.titleLabel.frame.size.height - self.subitemsSpace) / 2;
    // Center image
    CGPoint center = self.imageView.center;
    center.x = self.frame.size.width/2;
    center.y = self.imageView.frame.size.height/2 + y;
    self.imageView.center = center;
    
    //Center text
    CGRect newFrame = [self titleLabel].frame;
    newFrame.origin.x = 0;
    newFrame.origin.y = self.imageView.frame.size.height + self.subitemsSpace + y;
    newFrame.size.width = self.frame.size.width;
    self.titleLabel.frame = newFrame;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}
- (void)buttonStyleRight
{
    NSInteger x = (self.frame.size.width - self.imageView.frame.size.width - self.titleLabel.frame.size.width - self.subitemsSpace) / 2;
    //Center text
    CGRect newFrame = [self titleLabel].frame;
    newFrame.origin.x = x;
    newFrame.origin.y = self.frame.size.height/2 - self.titleLabel.frame.size.height/2;
    self.titleLabel.frame = newFrame;
    
    // Center image
    CGPoint center = self.imageView.center;
    center.x = CGRectGetMaxX(self.titleLabel.frame) + self.subitemsSpace + self.imageView.frame.size.width/2;
    center.y = self.frame.size.height/2;
    self.imageView.center = center;
}
- (void)buttonStyleBottom
{
     NSInteger y = (self.frame.size.height - self.imageView.frame.size.height - self.titleLabel.frame.size.height - self.subitemsSpace) / 2;
    //Center text
    CGRect newFrame = [self titleLabel].frame;
    newFrame.origin.x = 0;
    newFrame.origin.y = y;
    newFrame.size.width = self.frame.size.width;
    self.titleLabel.frame = newFrame;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    // Center image
    CGPoint center = self.imageView.center;
    center.x = self.frame.size.width/2;
    center.y = y + self.subitemsSpace + self.imageView.frame.size.height/2 + self.titleLabel.frame.size.height;
    self.imageView.center = center;
}

@end
