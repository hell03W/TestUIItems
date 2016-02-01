//
//  ViewController.m
//  TestUIItems
//
//  Created by  www.6dao.cc on 15/12/29.
//  Copyright © 2015年 www.6dao.com. All rights reserved.
//

#import "ViewController.h"
#import "WHAttributeText.h"
#import "TableViewDataModel.h"
#import "CustomTableViewCell.h"

#import "TestWHButton.h"
#import "TestWHStarsViewController.h"


@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, strong) NSArray *classArray;

@end

@implementation ViewController

- (NSArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = @[@"WHButton", @"WHStars"];
    }
    return _dataArray;
}
- (NSArray *)classArray
{
    if (!_classArray) {
        _classArray = @[@"TestWHButton", @"TestWHStarsViewController"];
    }
    return _classArray;
}

- (void)loadTableView
{
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
//    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone; //取消cell的分割线
    _tableView.separatorColor = [UIColor blueColor]; //分割线颜色
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadTableView];
}

#pragma mark - UITableViewDataSource
//1,cell数量
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}
//2,返回cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = @"ID";
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[CustomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate
//1,cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [CustomTableViewCell getCellHeight:self.dataArray[indexPath.row]];
}
//选中某一个cell时候调用
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *viewController;
    
    NSString *className = self.classArray[indexPath.row];
    id class = NSClassFromString(className);
    viewController = [[[class class] alloc] init];
    
    [self presentViewController:viewController animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
