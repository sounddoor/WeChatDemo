//
//  MEViewController.h
//  weChatDemo
//
//  Created by ioschen on 8/16/13.
//  Copyright (c) 2013 ioschen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MEViewController : UIViewController<UITableViewDataSource,UITabBarDelegate>
{
    UITableView *DataTable;
    NSMutableArray *dataArray1; //定义数据数组1
    NSMutableArray *dataArray2;//定义数据数组2
    NSMutableArray *dataArray3; //定义数据数组3
    NSMutableArray *dataArray4;//定义数据数组4
}


@end
