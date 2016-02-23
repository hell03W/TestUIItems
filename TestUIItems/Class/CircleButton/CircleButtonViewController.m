//
//  CircleButtonViewController.m
//  TestUIItems
//
//  Created by Walden on 16/2/23.
//  Copyright © 2016年 www.6dao.com. All rights reserved.
//

#import "CircleButtonViewController.h"
#import "CircleButton.h"

@interface CircleButtonViewController ()

@end

@implementation CircleButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self configCircleButton];
}

- (void)configCircleButton
{
    CircleButton *circleBtn = [[CircleButton alloc] initWithFrame:CGRectMake(40, 100, 200, 200)];
    [self.view addSubview:circleBtn];
    [circleBtn addTarget:self andSelector:@selector(circleBtnClick)];
    circleBtn.backgroundColor = [UIColor redColor];
    circleBtn.title = @"圆形Btn";
    circleBtn.borderWidth = 4;
    circleBtn.borderColor = [UIColor yellowColor];

}
- (void)circleBtnClick
{
    NSLog(@"circleButton click");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
