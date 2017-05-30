//
//  Choose_StepUp_action.h
//  identityx_reference
//
//  Created by GLOBAL on 8/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IdentityxReferenceAppDelegate.h"

@interface Choose_StepUp_action : UIViewController<UITableViewDelegate, UITableViewDataSource>
{
    IBOutlet UITableView *tblView;
    NSMutableArray *stepup_options;
    IdentityxReferenceAppDelegate *appDelegate;
}

@property(nonatomic, retain)IBOutlet UITableView *tblView;

-(IBAction)Logout_clicked:(id)sender;
-(IBAction)Home_clicked:(id)sender;

@end
