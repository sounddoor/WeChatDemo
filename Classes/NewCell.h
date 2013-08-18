//
//  NewCell.h
//  Dictionary
//
//  Created by feng liu on 11-1-15.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface NewCell : UITableViewCell {
	
	UILabel *textOne;
	UILabel *textTwo;

}

@property (nonatomic ,retain) IBOutlet UILabel *textOne;
@property (nonatomic ,retain) IBOutlet UILabel *textTwo;

@end
