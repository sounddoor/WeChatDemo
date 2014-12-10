//
//  WXViewController.m
//  weChatDemo
//

//  Created by ioschen on 8/16/13.
//  Copyright (c) 2013 ioschen. All rights reserved.
//

#import "WXViewController.h"
#import "CustomCell.h"
@interface WXViewController ()

@end

@implementation WXViewController
@synthesize listData;
@synthesize dataList;
@synthesize imageList;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        //获取TabBarItem属性所指向的UITabBarItem对象
        UITabBarItem *tbi=[self tabBarItem];
        //设置UITabBarItem对象的标题
        [tbi setTitle:@"微信"];
        //通过文件创建UIImage对象
        //如果当前设备支持Retina，那么UIImage类会用Hypno@2x.png来创建对象
        UIImage *i=[UIImage imageNamed:@"wx.png"];
        //将新创建的UIImage对象赋给UITabBarItem对象
        [tbi setImage:i];
        //高亮图片可以直接删除,
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    toolBar.barStyle =UIBarStyleBlack;
    UIBarButtonItem *leftButton=[[UIBarButtonItem alloc]initWithTitle:@"意见反馈" style:UIBarButtonItemStyleBordered target:self action:@selector(fankui)];
    UIBarButtonItem *flexibleSpace=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *titleButton=[[UIBarButtonItem alloc]initWithTitle:@"微信" style:UIBarButtonItemStylePlain target:nil action:nil];
    UIBarButtonItem *rightButton=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(showAlert)];
    NSArray *array=[[NSArray alloc]initWithObjects:leftButton,flexibleSpace,titleButton,flexibleSpace,rightButton, nil];
    [toolBar setItems:array];
    [self.view addSubview:toolBar];
    
    //加载plist文件的数据和图片
    NSBundle *bundle = [NSBundle mainBundle];
    NSURL *plistURL = [bundle URLForResource:@"friendsInfo" withExtension:@"plist"];
    
    NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfURL:plistURL];
    
    NSMutableArray *tmpDataArray = [[NSMutableArray alloc] init];
    NSMutableArray *tmpImageArray = [[NSMutableArray alloc] init];
    for (int i=0; i<[dictionary count]; i++) {
        NSString *key = [[NSString alloc] initWithFormat:@"%i", i+1];
        NSDictionary *tmpDic = [dictionary objectForKey:key];
        [tmpDataArray addObject:tmpDic];
        
        NSString *imageUrl = [[NSString alloc] initWithFormat:@"%i.png", i+1];
        UIImage *image = [UIImage imageNamed:imageUrl];
        [tmpImageArray addObject:image];
    }
    self.dataList = [tmpDataArray copy];
    self.imageList = [tmpImageArray copy];
}
#pragma mark 反馈意见，跳转网页
-(void)fankui
{
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"test" message:@"test" delegate:self cancelButtonTitle:@"test" otherButtonTitles:@"ok", nil];
    [alert show];
}
-(void)showAlert
{
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"test" message:@"test" delegate:self cancelButtonTitle:@"test" otherButtonTitles:@"ok", nil];
    [alert show];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CustomCellIdentifier = @"CustomCellIdentifier";
    
    static BOOL nibsRegistered = NO;
    if (!nibsRegistered) {
        UINib *nib = [UINib nibWithNibName:@"CustomCell" bundle:nil];
        [tableView registerNib:nib forCellReuseIdentifier:CustomCellIdentifier];
        nibsRegistered = YES;
    }
    
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:CustomCellIdentifier];
    if (cell == nil) {
        cell = [[CustomCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:CustomCellIdentifier];
    }
    
    NSUInteger row = [indexPath row];
    NSDictionary *rowData = [self.dataList objectAtIndex:row];
    
    cell.name = [rowData objectForKey:@"name"];
    cell.dec = [rowData objectForKey:@"dec"];
    cell.loc = [rowData objectForKey:@"loc"];
    cell.image = [imageList objectAtIndex:row];
    
    return cell;
}
#pragma mark Table Delegate Methods
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60.0;
}

- (NSIndexPath *)tableView:(UITableView *)tableView
  willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//还可以添加下拉刷新和滑动删除等等
@end

