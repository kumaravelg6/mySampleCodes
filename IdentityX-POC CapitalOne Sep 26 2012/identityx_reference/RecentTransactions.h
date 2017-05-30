//
//  RecentTransactions.h
//  NavBased
//
//  Created by icore on 07/08/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface RecentTransactions : UIViewController<UITableViewDelegate, UITableViewDataSource> {

	NSMutableArray *listOfItems;
	IBOutlet UITableView *tblview;
}

@property (nonatomic,retain) IBOutlet UITableView *tblview;

-(IBAction)Logout_clicked:(id)sender;
-(IBAction)Home_clicked:(id)sender;

@end
