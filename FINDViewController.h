//
//  FINDViewController.h
//  weChatDemo
//
//  Created by ioschen on 8/16/13.
//  Copyright (c) 2013 ioschen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FINDViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
//声明了一个存放数据的数组和用于显示单元格的两个对象
@property(strong,nonatomic)NSMutableArray *list;
@property(strong,nonatomic)NSMutableArray *list2;
@property(strong,nonatomic)NSMutableArray *list3;
@property(strong,nonatomic)NSMutableArray *list4;
@property(strong,nonatomic)UITableView *tableView;
@property(strong,nonatomic)UITableViewCell *tableViewCell;
@end

