//
//  TestTableViewCell.m
//  YHTableView
//
//  Created by 我叫MT on 16/9/6.
//  Copyright © 2016年 Pinksnow. All rights reserved.
//

#import "TestTableViewCell.h"
static NSString *const TestTableCell = @"TestTableViewCell";

@implementation TestTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

+(UINib *)nib
{
    return [UINib nibWithNibName:TestTableCell bundle:nil];
}

- (void)configureForLabel:(NSArray *)array
{
    for (NSString *string in array) {
        self.titleLabel.text = string;
        self.detailsLabel.text = [string stringByAppendingString:string];
    }
}

- (NSDateFormatter *)dateFormatter
{
    static NSDateFormatter *dateFormatter;
    if (!dateFormatter) {
        dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.timeStyle = NSDateFormatterMediumStyle;
        dateFormatter.dateStyle = NSDateFormatterMediumStyle;
    }
    return dateFormatter;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
