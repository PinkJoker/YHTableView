//
//  ViewController.m
//  YHTableView
//
//  Created by 我叫MT on 16/9/5.
//  Copyright © 2016年 Pinksnow. All rights reserved.
//

#import "ViewController.h"
#import "ArrayDataSource.h"
#import "TestTableViewCell.h"
#import "CellModal.h"
#define kWidth self.view.bounds.size.width
#define kHeight self.view.bounds.size.height

static NSString *const TestCell = @"TestTableViewCell";
@interface ViewController ()<UITableViewDelegate>
{
    CGRect firstFrame;
}
@property(nonatomic, strong)UITableView *tableView;
@property(nonatomic, strong)ArrayDataSource *dataSource;
@property(nonatomic, strong)CellModal *modal;

@property(nonatomic, strong)UIImageView *iconImage;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    
    self.iconImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kWidth, kWidth *0.55)];
    [self.view addSubview:self.iconImage];
    self.iconImage.image = [UIImage imageNamed:@"iconimage"];
    firstFrame = self.iconImage.frame;
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kWidth, kHeight) style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    
    TableViewCellConfigureBlock configureCell = ^(TestTableViewCell *cell,CellModal *modal){
        [cell configureForLabel:@[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8"]];
    };
    
    self.dataSource = [[ArrayDataSource alloc]initWithItems:@[@"什么啊",@"2",@"3"] cellIdentifier:TestCell configureCellBlock:configureCell];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.dataSource = self.dataSource;
    self.tableView.delegate = self;

    UIView *hView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWidth , firstFrame.size.height)];
    hView.backgroundColor = [UIColor clearColor];
    self.tableView.tableHeaderView = hView;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat off = scrollView.contentOffset.y;
    NSLog(@"%f",off);
    if (off > 0) {
        //跟随tableview
        self.iconImage.frame = ({
            CGRect frame = self.iconImage.frame;
            frame.origin.y = firstFrame.origin.y - off;
            frame;
        });
        //固定图片（这样当cell的个数很少时 向上滑动会漏出背景图片）
//        self.iconImage.frame = firstFrame;
    }else
    {
        //下拉放大图片
        self.iconImage.frame = ({
            CGRect frame = firstFrame;
            frame.size.height = firstFrame.size.height - off;
            frame.size.width = frame.size.height /0.55;
            frame.origin.x = firstFrame.origin.x - (frame.size.width - firstFrame.size.width)/2;
            frame;
        });
        

        
        
    }
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
