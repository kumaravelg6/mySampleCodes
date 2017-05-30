//
//  AccountSummary.h
//  NavBased
//
//  Created by icore on 06/08/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RootViewController;
@class RecentTransactions;

@interface AccountSummary : UIViewController<UITableViewDelegate, UITableViewDataSource> {

	NSMutableArray *listOfItems;
	IBOutlet UITableView *tblview;
	
}

@property (nonatomic,retain) IBOutlet UITableView *tblview;

-(IBAction)Logout_clicked:(id)sender;
-(IBAction)Home_clicked:(id)sender;
-(IBAction)Back_clicked:(id)sender;

@end
