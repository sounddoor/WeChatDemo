//
//  TXLViewController.m
//  weChatDemo
//
//  Created by ioschen on 8/16/13.
//  Copyright (c) 2013 ioschen. All rights reserved.
//

#import "TXLViewController.h"
#import "NewCell.h"
@interface TXLViewController ()

@end

@implementation TXLViewController
@synthesize list;
@synthesize dictionary;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        UITabBarItem *tbi=[self tabBarItem];
        [tbi setTitle:@"通讯录"];
        UIImage *i=[UIImage imageNamed:@"txl.png"];
        [tbi setImage:i];
    }
    return self;
}

- (void)viewDidLoad {
    UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    toolBar.barStyle = UIBarStyleBlackOpaque;
    UIBarButtonItem *flexibleSpace=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *titleButton=[[UIBarButtonItem alloc]initWithTitle:@"通讯录" style:UIBarButtonItemStylePlain target:nil action:nil];
    UIBarButtonItem *rightButton=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(showAlert)];
    NSArray *array=[[NSArray alloc]initWithObjects:flexibleSpace,titleButton,flexibleSpace,rightButton, nil];
    [toolBar setItems:array];
    [self.view addSubview:toolBar];
    //初始化tableview
    DataTable=[[UITableView alloc] initWithFrame:CGRectMake(0, 44, self.view.frame.size.width, self.view.frame.size.height)];//指定位置大小
    [DataTable setDelegate:self];//指定委托
    [DataTable setDataSource:self];//指定数据委托
    [self.view addSubview:DataTable];//加载tableview
    
	//加载文件
	NSString *path = [[NSBundle mainBundle] pathForResource:@"sortednames" ofType:@"plist"];
	//从加载的文件新建一个字典
	NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
	//把新建的字典分配给disctionary
	self.dictionary = dict;
	//把字典里的数组按照字母顺序排序
	NSArray *arraytxl = [[dictionary allKeys] sortedArrayUsingSelector:@selector(compare:)];
	//分配给list
	self.list = arraytxl;
    [super viewDidLoad];
}
-(void)showAlert
{
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"test" message:@"test" delegate:self cancelButtonTitle:@"test" otherButtonTitles:@"ok", nil];
    [alert show];
}
#pragma mark - 实现协议方法
#pragma mark 返回分组数目
//在tableview中有多少个分组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	//每个数组都有一个分组
	return [list count];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	//获取分组
	NSString *key = [list objectAtIndex:section];
	//获取分组里面的数组
	NSArray *array =[dictionary objectForKey:key];
	return [array count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	//索引路径
	NSInteger section = [indexPath section];
	NSInteger row = [indexPath row];
	//获取分组
	NSString *key = [list objectAtIndex:section];
	//获取分组里面的数组
	NSArray *array =[dictionary objectForKey:key];
	//建立可重用单元标识
	static NSString *customCell = @"customCell";
	NewCell *cell = (NewCell *)[tableView dequeueReusableCellWithIdentifier:customCell];
	
	if (cell == nil) {
		//如果没有可重用的单元，我们就从nib里面加载一个，
		NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"NewCell"
													 owner:self options:nil];
		//迭代nib重的所有对象来查找NewCell类的一个实例
		for (id oneObject in nib) {
			if ([oneObject isKindOfClass:[NewCell class]]) {
				cell = (NewCell *)oneObject;
			}
		}
	}
	//在xib里面链接好以后，分别设置textone和texttwo的text值
	NSString *ShowTextTwo = [list objectAtIndex:section];
	NSString *newText = [[NSString alloc] initWithFormat:@"数据在“%@”分组",ShowTextTwo];
	cell.textOne.text = [array objectAtIndex:row];
	cell.textTwo.text = newText;
	return cell;
}
//获取分组标题并显示
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
	NSString *key = [list objectAtIndex:section];
	return key;
}
//给tableviewcell添加索引
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
	return list;
}
//重新设置一下tableviewcell的行高为70
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 70;
}
@end