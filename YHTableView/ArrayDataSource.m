//
//  ArrayDataSource.m
//  YHTableView
//
//  Created by 我叫MT on 16/9/6.
//  Copyright © 2016年 Pinksnow. All rights reserved.
//

#import "ArrayDataSource.h"
#import "TestTableViewCell.h"
#import <BlocksKit.h>

static NSString *const TestCell = @"TestTableViewCell";

@interface ArrayDataSource ()

@property(nonatomic, strong)NSArray *items;
@property(nonatomic, copy)NSString *cellIdentifier;
@property(nonatomic, copy)TableViewCellConfigureBlock cellBlock;
@end

@implementation ArrayDataSource


-(id)initWithItems:(NSArray *)items cellIdentifier:(NSString *)cellIdentifier configureCellBlock:(TableViewCellConfigureBlock)cellBlock
{
    self = [super init];
    if (self) {
        self.items = items;
        self.cellIdentifier = cellIdentifier;
        self.cellBlock = cellBlock;

    }
    return self;
}


-(id)itemAtIndexPath:(NSIndexPath *)indexPath
{
    return self.items[indexPath.row];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.items.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TestTableViewCell *testCell = [tableView dequeueReusableCellWithIdentifier:TestCell];
    if (testCell == nil) {
        testCell =[ [NSBundle mainBundle]loadNibNamed:@"TestTableViewCell" owner:self options:nil].lastObject ;
    }
    
    id item = [self itemAtIndexPath:indexPath];
    self.cellBlock(testCell,item);
    return testCell;
    
}



@end
