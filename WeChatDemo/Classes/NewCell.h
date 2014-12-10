//
//  NewCell.h
//  Dictionary
//
//  Created by ioschen on 8/16/13.
//  Copyright (c) 2013 ioschen. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface NewCell : UITableViewCell {
	
	UILabel *textOne;
	UILabel *textTwo;

}

@property (nonatomic ,retain) IBOutlet UILabel *textOne;
@property (nonatomic ,retain) IBOutlet UILabel *textTwo;

@end
