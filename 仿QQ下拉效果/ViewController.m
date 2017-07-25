//
//  ViewController.m
//  仿QQ下拉效果
//
//  Created by 梧上 on 17/7/25.
//  Copyright © 2017年 梧上. All rights reserved.
//

#import "ViewController.h"
#import "BPCustomNavBar.h"

static const CGFloat headHeight = 160.0f;
#define GREENCOLOR [UIColor colorWithRed:87/255.0 green:173/255.0 blue:104/255.0 alpha:1]

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

/**导航栏*/
@property (nonatomic,weak) BPCustomNavBar *navBar;

/**tableView*/
@property (nonatomic,weak) UITableView *tableView;

/**背景图片*/
@property (nonatomic,strong) UIImageView *bgView;

/**bgView*/
@property (nonatomic,assign) CGRect originalFrame;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建背景图片
    self.bgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"2"]];
    self.bgView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.width*0.8);
    self.originalFrame = self.bgView.frame;
    [self.view addSubview:self.bgView];
    
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    BPCustomNavBar *nav = [[BPCustomNavBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
    nav.title = @"风景如画";
    nav.titleColor = [UIColor whiteColor];
    nav.leftImage = @"back_icon";
    nav.rightImage = @"share_icon";
    nav.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.f];
    [self.view addSubview:nav];
    self.navBar = nav;
    
    
    //新建UItableView
    UITableView *table = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    table.backgroundColor = [UIColor clearColor];
    table.delegate = self;
    table.dataSource = self;
    [self.view addSubview:table];
    self.tableView = table;
    
    //添加头部
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, headHeight)];
    headerView.backgroundColor = [UIColor clearColor];
    self.tableView.tableHeaderView = headerView;
    
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        
    }
    cell.textLabel.text = [NSString stringWithFormat:@"第%zd行",indexPath.row];
    return cell;
}

#pragma mark -- scrollView的方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGFloat yoffset = scrollView.contentOffset.y;
    NSLog(@"===========%f",yoffset);
    //当其偏移量在headView的范围内的时候，navBar颜色的改变
    if (yoffset < headHeight) {
        self.navBar.titleColor = [UIColor whiteColor];
        self.navBar.leftImage = @"back_icon";
        self.navBar.rightImage = @"share_icon";
        self.navBar.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:yoffset/headHeight];
    }else {
        self.navBar.titleColor = [UIColor whiteColor];
        self.navBar.backgroundColor = [UIColor redColor];
        self.navBar.leftImage = @"back_icon";
        self.navBar.rightImage = @"share_icon";
    }
    
    //上下滑动的时候的背景图片的放大
    if (yoffset > 0) {//往上拖动
        self.bgView.frame = ({
            CGRect frame = self.bgView.frame;
            frame.origin.y = self.originalFrame.origin.y -yoffset;
            frame;
        });
        
        
    }else {//往下拖动
        
        self.bgView.frame = ({//高度变化的比较快
            CGRect frame = self.bgView.frame;
            frame.size.height = self.originalFrame.size.height -yoffset;
            frame.size.width = self.originalFrame.size.width * frame.size.height /self.originalFrame.size.height;
            frame.origin.x = -(frame.size.width - self.originalFrame.size.width)/2;
            frame.origin.y = 0;
            frame;
        });
        
        //        self.bgView.frame = ({//高度变化的快
        //            CGRect frame = self.bgView.frame;
        //            frame.size.width = self.originalFrame.size.width -yoffset;
        //            frame.size.height = self.originalFrame.size.height * frame.size.width /self.originalFrame.size.width;
        //            frame.origin.x = -(frame.size.width - self.originalFrame.size.width)/2;
        //      frame.origin.y = 0;
        //            frame;
        //        });
        
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
