//
//  MEViewController.m
//  weChatDemo
//
//  Created by ioschen on 8/16/13.
//  Copyright (c) 2013 ioschen. All rights reserved.
//

#import "MEViewController.h"

@interface MEViewController ()

@end

@implementation MEViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization//
        UITabBarItem *tbi=[self tabBarItem];
        [tbi setTitle:@"我"];
        UIImage *i=[UIImage imageNamed:@"me.png"];
        [tbi setImage:i];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    toolBar.barStyle = UIBarStyleBlack;
    //    UIBarButtonItem *leftButton=[[UIBarButtonItem alloc]initWithTitle:@"意见反馈" style:UIBarButtonItemStyleBordered target:self action:@selector(fankui)];
    
    UIBarButtonItem *flexibleSpace=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    UIBarButtonItem *titleButton=[[UIBarButtonItem alloc]initWithTitle:@"我" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    //    UIBarButtonItem *rightButton=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(showAlert)];
    NSArray *array=[[NSArray alloc]initWithObjects:flexibleSpace,titleButton,flexibleSpace,nil];
    [toolBar setItems:array];
    [self.view addSubview:toolBar];
    
    //初始化tableview
    CGRect frame=CGRectMake(0, 44, self.view.frame.size.width, self.view.frame.size.height);
    DataTable = [[UITableView alloc]initWithFrame:frame style:UITableViewStyleGrouped];
    [DataTable setDataSource:self];
    [DataTable setDelegate:self];//指定委托
    [self.view addSubview:DataTable];//加载tableview
    
    dataArray1 = [[NSMutableArray alloc] initWithObjects:@"义薄云天", nil];
    dataArray2 =[[NSMutableArray alloc] initWithObjects:@"我的相册", @"我的收藏", nil];
    dataArray3 = [[NSMutableArray alloc] initWithObjects:@"表情商店", nil];
    dataArray4 = [[NSMutableArray alloc] initWithObjects:@"设置", nil];
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

//指定有多少个分区(Section)，默认为1
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    //return [titleArray count];//返回标题数组中元素的个数来确定分区的个数
    return 4;
}

//指定每个分区中有多少行，默认为1
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return [dataArray1 count];//每个分区通常对应不同的数组，返回其元素个数来确定分区的行数
            break;
        case 1:
            return [dataArray2 count];
            break;
        case 2:
            return [dataArray3 count];//每个分区通常对应不同的数组，返回其元素个数来确定分区的行数
            break;
        case 3:
            return [dataArray4 count];
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
            [[cell textLabel]setText:[dataArray1 objectAtIndex:indexPath.row]];//给cell添加数据
            break;
        case 1://对应各自的分区
            [[cell textLabel]setText:[dataArray2 objectAtIndex:indexPath.row]];//给cell添加数据
            break;
        case 2://对应各自的分区
            [[cell textLabel]setText:[dataArray3 objectAtIndex:indexPath.row]];//给cell添加数据
            break;
        case 3://对应各自的分区
            [[cell textLabel]setText:[dataArray4 objectAtIndex:indexPath.row]];//给cell添加数据
            break;
        default:
            [[cell textLabel]setText:@"Unknown"];
            break;
    }
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end