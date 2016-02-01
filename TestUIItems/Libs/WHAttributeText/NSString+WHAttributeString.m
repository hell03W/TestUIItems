//
//  NSString+WHAttributeString.m
//  WHAttributeText
//
//  Created by  www.6dao.cc on 15/12/23.
//  Copyright © 2015年 wandels. All rights reserved.
//

#import "NSString+WHAttributeString.h"

@implementation NSString (WHAttributeString)

// 以指定字符为分割,左边是一种格式,右边的字符串是另一种格式.
- (NSMutableAttributedString *)getSpecialTextWithDecollator:(NSString *)decollator andLeftAttribute:(void (^)(WHText *make))leftMake andRightAttribute:(void (^)(WHText *make))rightMake
{
    return [NSString getSpecialTextWithText:self Decollator:decollator andLeftAttribute:leftMake andRightAttribute:rightMake];
}

- (NSMutableAttributedString *)getSpecialTextWithFrontN:(NSInteger)n andLeftAttribute:(void (^)(WHText *make))leftMake andRightAttribute:(void (^)(WHText *make))rightMake
{
    //左边
    WHText *leftAttributeText = [WHText text];
    leftMake(leftAttributeText);
    NSDictionary *leftDict = [leftAttributeText getAttributeDictionary];
    
    WHText *rightAttributeText = [WHText text]; //清除所有的属性, 两次使用属性  使用同一个对象
    
    rightMake(rightAttributeText);
    NSDictionary *rightDict = [rightAttributeText getAttributeDictionary];
    
    
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:self];
    
    //如果n大于字符串的长度, n赋值为字符串的长度
    n = (n > self.length)?self.length : n;
    
    NSRange leftRange = NSMakeRange(0, n);
    NSRange rightRang = NSMakeRange(n, self.length-n);
    
    [attributeString addAttributes:leftDict range:leftRange];
    if (n < self.length) {
        [attributeString addAttributes:rightDict range:rightRang];
    }
    
    return attributeString;
}

- (float)getTextWidth:(void (^)(WHText *make))block
{
    WHText *attText = [WHText textWithString:self];
    block(attText);
    return attText.width;
}



// 以指定字符为分割,左边是一种格式,右边的字符串是另一种格式.
+ (NSMutableAttributedString *)getSpecialTextWithText:(NSString *)text Decollator:(NSString *)decollator andLeftAttribute:(void (^)(WHText *make))leftMake andRightAttribute:(void (^)(WHText *make))rightMake
{
    NSInteger index;
    NSRange range = [text rangeOfString:decollator];
    if (range.location == NSNotFound) {
        index = text.length;
    }else{
        index = range.location+1;
    }
    
    return [text getSpecialTextWithFrontN:index andLeftAttribute:leftMake andRightAttribute:rightMake];
}

@end
