//
//  CircleButton.h
//  newBee
//
//  Created by  www.6dao.cc on 16/1/18.
//  Copyright © 2016年 GET-CC. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CircleButton : UIView

@property (nonatomic, strong) NSString *title; // 标题, 圆形上面的文字

@property (nonatomic, assign) double borderWidth; // border宽度

@property (nonatomic, strong) UIColor *borderColor;

- (void)addTarget:(id)target andSelector:(SEL)sel; // 设置点击时候 执行的方法

@end
