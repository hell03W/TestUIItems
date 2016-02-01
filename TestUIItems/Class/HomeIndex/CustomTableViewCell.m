//
//  CustomTableViewCell.m
//  TableViewDemo
//
//  Created by  www.6dao.cc on 15/12/15.
//  Copyright © 2015年 www.6dao.com. All rights reserved.
//

#import "CustomTableViewCell.h"
#import "WHAttributeText.h"

@interface CustomTableViewCell ()

@property (nonatomic, strong) UILabel *testLabel;

@end

@implementation CustomTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone; //无选中效果
        
        
        
    }
    return self;
}

//获取可变cell的高度
+ (float)getCellHeight:(id)model
{
    return 45;
}

- (void)setDataModel:(TableViewDataModel *)dataModel
{
    _dataModel = dataModel;
    self.textLabel.text = _dataModel.title;
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
