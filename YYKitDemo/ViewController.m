//
//  ViewController.m
//  YYKitDemo
//
//  Created by suiyuping on 2018/1/26.
//  Copyright © 2018年 suiyuping. All rights reserved.
//

#import "ViewController.h"
#import "ModelViewController.h"
#import "CacheViewController.h"
#import "ImageViewController.h"
#import "WebImageViewController.h"
#import "TextViewController.h"
#import "KeyboardManagerViewController.h"
#import "DispatchQueuePoolViewController.h"
#import "AsyncLayerViewController.h"
#import "CategoriesViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView * tableView;
@property (nonatomic,assign)NSMutableArray * titleArray;
@end

@implementation ViewController
- (void)loadView{
    self.title = @"YYKit";
    self.view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.view.backgroundColor = [UIColor whiteColor];
    CGFloat tableW = [[UIScreen mainScreen] bounds].size.width;
    CGFloat tableH = [[UIScreen mainScreen] bounds].size.height - 64;
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, tableW, tableH)];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    self.titleArray = [NSMutableArray arrayWithObjects:@"YYModel",@"YYCache",@"YYImage",@"YYWebImage",@"YYText",@"YYKeyboardManager",@"YYDispatchQueuePool",@"YYAsyncLayer",@"YYCategories", nil];
    NSLog(@"%@",_titleArray);
}
#pragma mark - TableView的代理方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.titleArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * identifer = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
    }
    cell.textLabel.text = [self.titleArray objectAtIndex:indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    int index = (int)[indexPath row];
    if (index == 0) {
        ModelViewController * vc = [[ModelViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (index == 1){
        CacheViewController * vc = [[CacheViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (index == 2){
        ImageViewController * vc = [[ImageViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (index == 3){
        WebImageViewController * vc = [[WebImageViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (index == 4){
        TextViewController * vc = [[TextViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (index == 5){
        KeyboardManagerViewController * vc = [[KeyboardManagerViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (index == 6){
        DispatchQueuePoolViewController * vc = [[DispatchQueuePoolViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (index == 7){
        AsyncLayerViewController * vc = [[AsyncLayerViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (index == 8){
        CategoriesViewController * vc = [[CategoriesViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
























- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
