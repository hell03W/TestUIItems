//
//  CircleButton.m
//  newBee
//
//  Created by  www.6dao.cc on 16/1/18.
//  Copyright © 2016年 GET-CC. All rights reserved.
//

#import "CircleButton.h"

@interface CircleButton ()
{
    SEL _clickSel;
}
@property (nonatomic, weak) id target;
@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation CircleButton

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.0];
        self.layer.cornerRadius = frame.size.width / 2;
        self.clipsToBounds = YES;
        
        UILabel *label          = [[UILabel alloc] initWithFrame:self.bounds];
        [self addSubview:label];
        label.font              = [UIFont systemFontOfSize:15];
        label.textAlignment     = NSTextAlignmentCenter;
        label.backgroundColor   = [UIColor clearColor];
        _titleLabel             = label;
        
        //点击事件
        UITapGestureRecognizer*tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickThisView)];
        [self addGestureRecognizer:tap];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    UIBezierPath *bPath = [UIBezierPath bezierPathWithOvalInRect:rect];
    [self.backgroundColor setFill];
    [self.borderColor setStroke];
    [bPath setLineWidth:self.borderWidth];
    [bPath addClip];
    [bPath fill];
    [bPath stroke];
}


- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    CGPoint circleCenter    = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    double circleRadius     = self.frame.size.width/2;
    double distance         = pow((circleCenter.x - point.x), 2) + pow((circleCenter.y - point.y), 2);
    
    if (distance < pow(circleRadius, 2)) {
        return self;
    } else {
        return nil;
    }
}

- (void)clickThisView{
    if (_target && _clickSel && [_target respondsToSelector:_clickSel]) {
        [_target performSelector:_clickSel];
    }
}

- (double)borderWidth
{
    return _borderWidth;
}

- (void)setTitle:(NSString *)title
{
    _title                  = title;
    _titleLabel.text = _title;
}

- (void)addTarget:(id)target andSelector:(SEL)sel
{
    _target = target;
    _clickSel = sel;
}

@end
