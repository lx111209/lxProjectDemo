//
//  LXTableViewController.m
//  runTimeTest
//
//  Created by iOS-01 on 16/11/23.
//  Copyright © 2016年 iOS-01. All rights reserved.
//

#import "LXTableViewController.h"
#import "UIImageView+Tap.h"
#import "LXTableViewCell.h"

@interface LXTableViewController ()

@end

@implementation LXTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
//    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"iden"];
    [self.tableView registerNib:[UINib nibWithNibName:@"LXTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"LXTableViewCell"];
    [[CADisplayLink displayLinkWithTarget:self selector:@selector(displayLinkAction:)]  addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
}

- (void)displayLinkAction:(CADisplayLink *)link {
    
    static NSTimeInterval lastTime = 0;
    static int frameCount = 0;
    if (lastTime == 0) { lastTime = link.timestamp; return; }
    frameCount++; // 累计帧数
    NSTimeInterval passTime = link.timestamp - lastTime;// 累计时间
    if (passTime > 0.1) { // 1秒左右获取一次帧数
        int fps = frameCount / passTime; // 帧数 = 总帧数 / 时间
        lastTime = link.timestamp; // 重置
        frameCount = 0; // 重置
        NSLog(@"%d", fps);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1000;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LXTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LXTableViewCell" forIndexPath:indexPath];
    
    [cell.imgView imageWithURLString:@"https://ss0.bdstatic.com/94oJfD_bAAcT8t7mm9GUKT-xh_/timg?image&quality=100&size=b4000_4000&sec=1479868103&di=f1dca40cfad8ff299a3a0b76ce1674f0&src=http://img.hb.aicdn.com/761f1bce319b745e663fed957606b4b5d167b9bff70a-nfBc9N_fw580" placeholderImage:@"111" options:SDWebImageRetryFailed layerWithIsCorner:YES withRadius:20];
    
    cell.lab.text = [NSString stringWithFormat:@"%ld", (long)indexPath.row];
    [cell.imgView addTapGuesterWithIsEnlarge:YES];

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}


@end
