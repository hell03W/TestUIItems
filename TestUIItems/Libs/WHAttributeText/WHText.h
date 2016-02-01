//
//  WHText.h
//  WHText
//
//  Created by len on 15/10/21.
//  Copyright (c) 2015年 wandels. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class WHText;

typedef  WHText *(^WHBlockFloat)(CGFloat);
typedef  WHText *(^WHBlockColor)(UIColor *);
typedef  WHText *(^WHBlockNumber)(NSNumber *);

@interface WHText : NSObject

/*
 属性字符串   属性字典   label
 */
//其它方法

//1, 创建对象
- (id)initWithString:(NSString *)text;

+ (id)text;
+ (id)textWithString:(NSString *)text;

//2，返回 属性字符串
- (id)getText;
+ (id)getTextWithString:(NSString *)text andAttribute:(void (^)(WHText *make))block;

//3，获取一个放着属性字符串的label
- (UILabel *)getLabel;
- (UILabel *)getLabelWithText:(NSString *)text andWidth:(float)width andAttribute:(void (^)(WHText *make))block;
+ (UILabel *)getLabelWithText:(NSString *)text andAttribute:(void (^)(WHText *make))block;
+ (UILabel *)getLabelWithText:(NSString *)text andWidth:(float)width andAttribute:(void (^)(WHText *make))block;

//4, 返回属性字典
- (id)getAttributeDictionary;
+ (id)getAttributeDictionary:(void (^)(WHText *make))block;

//5, 设置属性并返回字符串的长度
+ (NSInteger)getTextWidthString:(NSString *)text attribute:(void (^)(WHText *make))block;










//0, label 的宽度，width 设置label的宽度;   height得到label的高度
@property (nonatomic, assign)CGFloat width;
@property (nonatomic, assign)CGFloat height;
//1, 要给设置属性的 字符串
@property (nonatomic, strong)NSString *string;
//2, 放文字的Label的size，可以设置，也可以获取
@property (nonatomic, assign)CGSize size;


//文字属性
//1,文字大小
@property (nonatomic, assign)CGFloat whFontSize;
//2，字体颜色
@property (nonatomic, strong)UIColor *whFontColor;
//3,文字所在区域背景颜色
@property (nonatomic, strong)UIColor *whFontBackgroundColor;
//4，字符间距
@property (nonatomic, strong)NSNumber *whFontKern;
//5，设置下划线
@property (nonatomic, strong)NSNumber *whFontUnderline;
//6，设置下划线颜色
@property (nonatomic, strong)UIColor *whFontUnderlineColor;
//7，设置字体倾斜度  ，负值向左，正值向右
@property (nonatomic, strong)NSNumber *whFontObliqueness;



//段落属性
//1，设置段落属性
@property (nonatomic, strong)NSMutableParagraphStyle *whParagrahStyle;

//2,行间距
@property (nonatomic, assign)CGFloat whParaLineSpacing;
//3,段间距
@property (nonatomic, assign)CGFloat whParaSpacing;
//4,对齐方式
@property (nonatomic, readwrite)NSTextAlignment whParaAlignment;
//5,首行缩进
@property(nonatomic, readwrite) CGFloat whParaFirstLineHeadIndent;
//6,最小行高
@property(nonatomic, readwrite) CGFloat whParaMinimumLineHeight;
//7,最大行高
@property(nonatomic, readwrite) CGFloat whParaMaximumLineHeight;
//8,除首行之外其他行缩进
@property(nonatomic, readwrite) CGFloat whParaHeadIndent;



//支持链式编程 链式编程 需要借助block来实现
- (WHBlockFloat)fontSize;
- (WHBlockColor)fontColor;
- (WHBlockColor)fontBackgroundColor;
- (WHBlockNumber)fontKern;
- (WHBlockNumber)fontUnderline;
- (WHBlockColor)fontUnderlineColor;
- (WHBlockNumber)fontObliqueness;

- (WHBlockFloat)paraLineSpacing;
- (WHBlockFloat)paraSpacing;
- (WHText *(^)(NSTextAlignment))paraAlignment;
- (WHBlockFloat)paraFirstLineHeadIndent;
- (WHBlockFloat)paraMinimumLineHeight;
- (WHBlockFloat)paraMaximumLineHeight;
- (WHBlockFloat)paraHeadIndent;

//设置长宽,主要用到设置label的宽度,根据设置的宽度返回label的宽度.
- (WHBlockFloat)textWidth;
- (WHBlockFloat)textHeight;


- (WHText *)and;
- (WHText *)with;



/*NSShadow用法：
 NSShadow *shadow = [[NSShadow alloc] init];
 shadow.shadowColor = [UIColor redColor]; //设置阴影的颜色
 shadow.shadowOffset = CGSizeMake(2, 1);//设置阴影的偏移方向，x：左右，负左正右；y：上下，负上正下
 shadow.shadowBlurRadius = 5;  
 */
// 详细属性见：http://blog.csdn.net/weidfyr/article/details/48316775

@end
/*
使用说明：
 1，必须调用第二个方法之后，才能获取label的高度
 2，可以一个一个的设置属性，同时支持链式编程，链式的设置属性
 */







