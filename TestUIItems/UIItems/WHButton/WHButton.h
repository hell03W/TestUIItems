//
//  WHButton.h
//  TestUIItems
//
//  Created by  www.6dao.cc on 16/1/5.
//  Copyright © 2016年 www.6dao.com. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    WHButtonStyleImageOriginal,
    WHButtonStyleImageLeft,
    WHButtonStyleImageRight,
    WHButtonStyleImageTop,
    WHButtonStyleImageBottom,
    WHButtonStyleLeftAlignment
} WHButtonStyle;

@interface WHButton : UIButton

@property (nonatomic, assign) WHButtonStyle buttonStyle;
@property (nonatomic, assign) NSInteger subitemsSpace;

@end





