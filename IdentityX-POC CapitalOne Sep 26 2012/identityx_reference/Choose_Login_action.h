//
//  Choose_Login_action.h
//  identityx_reference
//
//  Created by GLOBAL on 9/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IdentityxReferenceAppDelegate.h"

@interface Choose_Login_action : UIViewController<UITableViewDelegate, UITableViewDataSource>
{
    IBOutlet UITableView *tblView;
    NSMutableArray *login_options;
    IdentityxReferenceAppDelegate *appDelegate;
    BOOL isEnrolled_and_Login;
}
@property(nonatomic, retain)IBOutlet UITableView *tblView;
@property (nonatomic, assign) BOOL isEnrolled_and_Login;

-(IBAction)Logout_clicked:(id)sender;
-(IBAction)Home_clicked:(id)sender;

@end
