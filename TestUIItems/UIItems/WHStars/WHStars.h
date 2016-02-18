//
//  WHStars.h
//  TestUIItems
//
//  Created by  www.6dao.cc on 16/1/14.
//  Copyright © 2016年 www.6dao.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WHStars : UIView

@property (nonatomic, assign) double starNumber; // Totle star number
@property(assign,nonatomic) double fillStarNumber; // Fill star number
@property(assign,nonatomic) BOOL clickAble; //clickAble Default is NO
@property (nonatomic, assign) double starWidth; //Default is 15

- (id)initWithStarNumber:(double)number; // init func

// change star Image
- (void)setHoleImage:(NSString *)holeImage fillImage:(NSString *)fillImage;
- (void)setHoleImage:(NSString *)holeImage fillImage:(NSString *)fillImage halfImage:(NSString *)halfImage;

// get object with +
+ (id)starWithStarNumber:(double)number;
+ (id)starWithStarNumber:(double)number fillStarNumber:(double)fillnumber;

@end
