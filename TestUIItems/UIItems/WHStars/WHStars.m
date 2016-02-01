//
//  Stars.m
//  LittleBee
//
//  Created by  www.6dao.cc on 15/12/21.
//  Copyright © 2015年 www.6dao.com. All rights reserved.
//

#import "WHStars.h"

@interface WHStars ()

@property (nonatomic, strong) NSMutableArray *starsArray;

@property (nonatomic, strong) NSString *fillStar;
@property (nonatomic, strong) NSString *holeStar;
@property (nonatomic, strong) NSString *halfStar;

@end

@implementation WHStars

- (NSMutableArray *)starsArray
{
    if (!_starsArray) {
        _starsArray = [NSMutableArray array];
        for (int i = 0; i < self.numberOfStar; i++) {
            UIButton *starBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            [starBtn setImage:[UIImage imageNamed:_holeStar] forState:0];
            [starBtn addTarget:self action:@selector(starButtonClick:) forControlEvents:64];
            starBtn.tag = i;
            starBtn.enabled = NO;
            starBtn.adjustsImageWhenDisabled = NO;
            starBtn.adjustsImageWhenHighlighted = NO;
            [_starsArray addObject:starBtn];
        }
    }
    return _starsArray;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        _starWidth = 20;
        _halfStar = @"starban@2x";
        _holeStar = @"stardak@2x";
        _fillStar = @"stardashi@2x";
    }
    return self;
}

- (id)initWithStarNumber:(double)number
{
    self = [self initWithFrame:CGRectZero];
    self.numberOfStar = number;
    return self;
}

- (void)loadMainView
{
    UIView *lastStar;

    //将星星放到view上去
    for (int i = 0; i < self.starsArray.count; i++) {
        UIButton *starButton = self.starsArray[i];
        [self addSubview:starButton];
        if (!lastStar) {
            starButton.frame = CGRectMake(0, 0, _starWidth, self.frame.size.height);
        }else{
            starButton.frame = CGRectMake(CGRectGetMaxX(lastStar.frame)+4, 0, _starWidth, self.frame.size.height);
        }

        lastStar = starButton;
    }
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    UIView *lastStar;
    
    for (UIView *subView in self.subviews) {
        if (!lastStar) {
            subView.frame = CGRectMake(0, 0, _starWidth, self.frame.size.height);
        }else{
            subView.frame = CGRectMake(CGRectGetMaxX(lastStar.frame)+4, 0, _starWidth, self.frame.size.height);
        }

        lastStar = subView;
    }
}

//set方法, 设置被填充星星的数量
- (void)setFillStarNumber:(double)fillStarNumber
{
    _fillStarNumber = fillStarNumber > self.numberOfStar ? self.numberOfStar : fillStarNumber;
    
    double decimal =_fillStarNumber - (int)_fillStarNumber;
    BOOL flag = ((decimal > 1.0/3.0) && (decimal < 2.0/3.0)) ? YES : NO;
    
    for (int i = 0; i < _fillStarNumber; i++) {
        UIButton *starButton = [self.starsArray objectAtIndex:i];
        [starButton setImage:[UIImage imageNamed:_fillStar] forState:0];
    }
    for (int j = _fillStarNumber; j < self.numberOfStar; j++) {
        UIButton *starButton = [self.starsArray objectAtIndex:j];
        [starButton setImage:[UIImage imageNamed:_holeStar] forState:0];
    }
    if (flag) {
        UIButton *starButton = [self.starsArray objectAtIndex:(int)_fillStarNumber];
        [starButton setImage:[UIImage imageNamed:_halfStar] forState:0];
    }
}

- (void)setStarWidth:(double)starWidth
{
    _starWidth = starWidth;
    [self layoutSubviews];
}

//get方法,获取星星数量
- (double)numberOfStar
{
    if (_numberOfStar == 0) {
        _numberOfStar = 5;
    }
    return _numberOfStar;
}

//set方法,设置星星是否可以被点击
- (void)setClickAble:(BOOL)clickAble
{
    _clickAble = clickAble;
    
    for (UIButton *btn in self.starsArray) {
        btn.enabled = _clickAble;
    }
}

//星星的点击事件
- (void)starButtonClick:(UIButton *)sender
{
    NSLog(@"starButtonTag = %ld", sender.tag);
    
    self.fillStarNumber = sender.tag+1;
    
}

//set方法, 设置星星的总数量
- (void)setNumberOfStar:(double)numberOfStar
{
    _numberOfStar = numberOfStar;
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    [self loadMainView];
}

- (void)setHoleImage:(NSString *)holeImage fillImage:(NSString *)fillImage
{
    _holeStar = holeImage;
    _fillStar = fillImage;
}
- (void)setHoleImage:(NSString *)holeImage fillImage:(NSString *)fillImage halfImage:(NSString *)halfImage
{
    [self setHoleImage:holeImage fillImage:fillImage];
    _halfStar = halfImage;
    
    [self layoutSubviews];
}

+ (id)starWithStarNumber:(double)number
{
    return [[self alloc] initWithStarNumber:number];
}


+ (id)starWithStarNumber:(double)number fillStarNumber:(double)fillnumber
{
    WHStars *stars = [[WHStars alloc] initWithStarNumber:number];
    stars.fillStarNumber = fillnumber;
    return stars;
}

@end
