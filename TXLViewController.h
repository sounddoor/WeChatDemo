//
//  TXLViewController.h
//  weChatDemo
//
//  Created by ioschen on 8/16/13.
//  Copyright (c) 2013 ioschen. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface TXLViewController : UIViewController<UITableViewDataSource,UITabBarDelegate>
{
	//定义字典和数组
	NSDictionary *dictionary;
	NSArray *list;
    
    UITableView *DataTable;
}
@property (nonatomic ,retain) NSDictionary *dictionary;
@property (nonatomic ,retain) NSArray *list;
@end