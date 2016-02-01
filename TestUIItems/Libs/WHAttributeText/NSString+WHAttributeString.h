//
//  NSString+WHAttributeString.h
//  WHAttributeText
//
//  Created by  www.6dao.cc on 15/12/23.
//  Copyright © 2015年 wandels. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WHText.h"

@interface NSString (WHAttributeString)


// 实例方法: 根据一个字符串,设置字符串以指定字符为分割,左边和右边属性不同  返回属性字符串
- (NSMutableAttributedString *)getSpecialTextWithDecollator:(NSString *)decollator andLeftAttribute:(void (^)(WHText *make))leftMake andRightAttribute:(void (^)(WHText *make))rightMake;
// 实例方法: 根据一个字符串, 设置前n个字符和后n个字符的样式不同.  返回属性字符串
- (NSMutableAttributedString *)getSpecialTextWithFrontN:(NSInteger)n andLeftAttribute:(void (^)(WHText *make))leftMake andRightAttribute:(void (^)(WHText *make))rightMake;


//根据一个短字符串和字符串的属性,
- (float)getTextWidth:(void (^)(WHText *make))block;



// 类方法: 根据一个字符串,设置字符串以指定字符为分割,左边和右边属性不同  返回属性字符串
+ (NSMutableAttributedString *)getSpecialTextWithText:(NSString *)text Decollator:(NSString *)decollator andLeftAttribute:(void (^)(WHText *make))leftMake andRightAttribute:(void (^)(WHText *make))rightMake;

@end
