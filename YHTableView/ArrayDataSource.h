//
//  ArrayDataSource.h
//  YHTableView
//
//  Created by 我叫MT on 16/9/6.
//  Copyright © 2016年 Pinksnow. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^TableViewCellConfigureBlock)(id cell,id item);

@interface ArrayDataSource : NSObject<UITableViewDataSource>

-(id)initWithItems:(NSArray *)items cellIdentifier:(NSString *)cellIdentifier configureCellBlock:(TableViewCellConfigureBlock)cellBlock;
-(id)itemAtIndexPath:(NSIndexPath *)indexPath;

@end
