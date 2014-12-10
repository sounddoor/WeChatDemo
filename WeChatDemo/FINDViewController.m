//
//  FINDViewController.m
//  weChatDemo
//
//  Created by ioschen on 8/16/13.
//  Copyright (c) 2013 ioschen. All rights reserved.
//

#import "FINDViewController.h"

@interface FINDViewController ()

@end

@implementation FINDViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        UITabBarItem *tbi=[self tabBarItem];
        [tbi setTitle:@"发现"];
        UIImage *i=[UIImage imageNamed:@"find.png"];
        [tbi setImage:i];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    toolBar.barStyle = UIBarStyleBlackOpaque;
    UIBarButtonItem *flexibleSpace=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *titleButton=[[UIBarButtonItem alloc]initWithTitle:@"发现" style:UIBarButtonItemStylePlain target:nil action:nil];
    NSArray *array=[[NSArray alloc]initWithObjects:flexibleSpace,flexibleSpace,titleButton,flexibleSpace,flexibleSpace, nil];
    [toolBar setItems:array];
    [self.view addSubview:toolBar];
    
    
    [super viewDidLoad];
    //初始化表格
    CGRect frame=CGRectMake(0, 44, self.view.frame.size.width, self.view.frame.size.height);
    self.tableView = [[UITableView alloc]initWithFrame:frame style:UITableViewStyleGrouped];
    //设置协议，意思就是UITableView类的方法交给了tabView这个对象，让完去完成表格的一些设置操作
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    //把tabView添加到视图之上
    [self.view addSubview:self.tableView];
    //存放显示在单元格上的数据(取名叫arraylist不叫array是wxviewcontroller里面有了array，不能重复)
    NSMutableArray *arraylist=[NSMutableArray arrayWithObjects:@"朋友圈",nil];
    NSMutableArray *arraylist2=[NSMutableArray arrayWithObjects:@"扫一扫",@"摇一摇",nil];
    NSMutableArray *arraylist3=[NSMutableArray arrayWithObjects:@"附近的人",@"漂流瓶",nil];
    //两种方法
    NSMutableArray *arraylist4=[[NSMutableArray alloc] initWithObjects:@"游戏中心", nil];
    self.list=arraylist;
    self.list2=arraylist2;
    self.list3=arraylist3;
    self.list4=arraylist4;
}
#pragma mark -实现协议方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}
//指定每个分区中有多少行，默认为1
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return [self.list count];//每个分区通常对应不同的数组，返回其元素个数来确定分区的行数
            break;
        case 1:
            return [self.list2 count];
            break;
        case 2:
            return [self.list3 count];//每个分区通常对应不同的数组，返回其元素个数来确定分区的行数
            break;
        case 3:
            return [self.list4 count];
            break;
        default:
            return 0;
            break;
    }
}
//绘制Cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    //初始化cell并指定其类型，也可自定义cell
    UITableViewCell *cell = (UITableViewCell*)[tableView  dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    switch (indexPath.section) {
        case 0://对应各自的分区
            [[cell textLabel]setText:[self.list objectAtIndex:indexPath.row]];//给cell添加数据
            break;
        case 1://对应各自的分区
            [[cell textLabel]setText:[self.list2 objectAtIndex:indexPath.row]];//给cell添加数据
            break;
        case 2://对应各自的分区
            [[cell textLabel]setText:[self.list3 objectAtIndex:indexPath.row]];//给cell添加数据
            break;
        case 3://对应各自的分区
            [[cell textLabel]setText:[self.list4 objectAtIndex:indexPath.row]];//给cell添加数据
            break;
        default:
            [[cell textLabel]setText:@"未知"];
            break;
    }
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

//设置单元格高度
-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45;
}

//选中单元格所产生事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //弹出警告信息
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示"
                                                       message:@"test"
                                                      delegate:self
                                             cancelButtonTitle:@"OK"
                                             otherButtonTitles: nil];
        [alert show];
     [tableView deselectRowAtIndexPath:indexPath animated:YES];//去掉选中高亮颜色
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

