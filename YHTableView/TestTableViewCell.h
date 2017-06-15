//
//  TestTableViewCell.h
//  YHTableView
//
//  Created by 我叫MT on 16/9/6.
//  Copyright © 2016年 Pinksnow. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CellModal;
@interface TestTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailsLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *top;
//@property(nonatomic, strong)CellModal *modal;
- (void)configureForLabel:(NSArray *)array;
+(UINib *)nib;
@end
