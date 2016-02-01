//
//  CustomTableViewCell.h
//  TableViewDemo
//
//  Created by  www.6dao.cc on 15/12/15.
//  Copyright © 2015年 www.6dao.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableViewDataModel.h"

@interface CustomTableViewCell : UITableViewCell

@property (nonatomic, strong) TableViewDataModel *dataModel;


//获取cell高度
+ (float)getCellHeight:(id)model;

@end
