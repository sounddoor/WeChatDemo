//
//  WXViewController.h
//  weChatDemo
//
//  Created by ioschen on 8/16/13.
//  Copyright (c) 2013 ioschen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WXViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) NSArray *listData;
@property (strong, nonatomic) NSArray *dataList;
@property (strong, nonatomic) NSArray *imageList;
@end
