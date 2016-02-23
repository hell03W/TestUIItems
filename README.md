# TestUIItems
***

## 1, WHButton, 自定义的Button

WHButton继承自UIButton, 拥有UIButton所有的方法和属性, WHButton增加了两个属性`buttonStyle`和`subitemsSpace`, 前者作用是设置button的`展示样式`, 包含, 图片在左边, 图片在右边, 图片在上面, 图片在下面等几种情况, 如果不设置这个属性, 默认就是UIButton的原始样式; 后者作用是设置`图片和文字之间的距离`, 默认是5. 

**1.1, WHButton新增的属性**

```
//枚举变量, 不同的按钮样式
typedef enum : NSUInteger {
    WHButtonStyleImageOriginal,
    WHButtonStyleImageLeft,
    WHButtonStyleImageRight,
    WHButtonStyleImageTop,
    WHButtonStyleImageBottom,
    WHButtonStyleLeftAlignment
} WHButtonStyle;

@interface WHButton : UIButton

// 设置样式
@property (nonatomic, assign) WHButtonStyle buttonStyle;
// 设置图文间距
@property (nonatomic, assign) NSInteger subitemsSpace;

@end
```
**1.2, 设置图片左边 文字右边**

```
WHButton *customBtn1 = [WHButton buttonWithType:UIButtonTypeCustom];
[self.view addSubview:customBtn1];
customBtn1.frame = CGRectMake(110, 40, 100, 100);
[customBtn1 setTitle:@"title" forState:0];
[customBtn1 setImage:[UIImage imageNamed:@"zx-diban@2x"] forState:0];
customBtn1.buttonStyle = WHButtonStyleImageTop;
```
**1.3, 几种效果如下所示:**

![](http://ww4.sinaimg.cn/large/6281e9fbgw1f13a8p8z2jj20ku12awfr.jpg)

## 2, WHStars 评分功能
WHStars继承自UIView, 实现的功能是, 评分的功能, 通过WHStars可以方便的选择评分, 默认是通过星星展示评分的, 不过可以通过替换图片或者通过方法直接设置不同的图片; 可以通过设置打开或者关闭选择的功能, 用于展示或者评价等不同的场景.

**1.1, WHStars公开的属性和方法**

```
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
```

**1.2, WHStars简单使用**

```
WHStars *stars1 = [WHStars starWithStarNumber:7 fillStarNumber:2.5];
[self.view addSubview:stars1];
stars1.frame = CGRectMake(10, 80, 200, 30);
stars1.backgroundColor = [UIColor lightGrayColor];

stars1.clickAble = YES;
```
**1.3, WHStars效果**
![](http://ww1.sinaimg.cn/large/6281e9fbgw1f13e5pychrj20kk05074b.jpg)

## 3, ScrollViewController 可滑动的控制器
ScrollViewController如果自己的viewController需要可以滑动, 就可以通过继承这个控制器来实现可滑动的效果, 使用发放巨简单, 直接继承即可.

**ScrollViewController提供的方法和属性如下所示:**

```
@interface ScrollViewController : UIViewController

@property (nonatomic, strong) UIScrollView  *scrollView; // 控制滑动的UIScrollView
@property (nonatomic, strong) UIView        *slideView; // 放在UIScrollView上面的一层view, 根据具体情况在这个view上面放置具体的子控件
@property (nonatomic, assign) float         slideViewHeight; // 设置可滑动部分的高度, 最低和默认是屏幕的高度

// 设置滑动后漏出来的的背景色和前景色
- (void)setBackgroundColor:(UIColor *)bgColor foregroundColor:(UIColor *)foreColor;

@end
```

**使用demo:**

```
// 设置滑动后漏出来的背景色和展示时候的前景色, 默认都是白色
[self setBackgroundColor:[UIColor lightGrayColor] foregroundColor:[UIColor redColor]];
// 设置可滑动区域的高度, 如果设置的高度小于屏幕的高度, 则高度是屏幕的高度
self.slideViewHeight = 1000;
```

## 4, CircleButton 圆形的按钮
一般情况下使用layer的相关属性就可以定义出圆形的控件, 也可以定义出圆形的按钮, 但是有个bug, 当点击圆形按钮不在园内, 但在矩形控件区域时候, 圆形按钮的点击事件还会被触发, 这时候需要重写hitTest:withEvent:方法来判断点击的位置, 然后判断是否在圆形区域内部, `CircleButton` 对圆形按钮进行了封装, 可以更加方便的使用圆形按钮. 
**使用示例:**

```
CircleButton *circleBtn = [[CircleButton alloc] initWithFrame:CGRectMake(40, 100, 200, 200)];
[self.view addSubview:circleBtn];
[circleBtn addTarget:self andSelector:@selector(circleBtnClick)];
circleBtn.backgroundColor = [UIColor redColor];
circleBtn.title = @"圆形Btn";
circleBtn.borderWidth = 4;
circleBtn.borderColor = [UIColor yellowColor];
```
效果如下所示:

![](http://ww3.sinaimg.cn/large/6281e9fbgw1f19cj75lemj20fa09mmxh.jpg)






