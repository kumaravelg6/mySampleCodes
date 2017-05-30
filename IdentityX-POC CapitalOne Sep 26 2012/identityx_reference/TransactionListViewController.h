//
//  TransactionViewController.h
//  identityx_template
//
//  Created by Jonny Mortensen on 8/24/11.
//  Copyright 2011 Daon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IXAll.h"
#import "IdentityxReferenceAppDelegate.h"

@class LoginScreen;

// This is the main screen of the application. It shows a list of transactions and is
// the starting point for all the biometrics capture screens.

@interface TransactionListViewController : UIViewController 
{
    IdentityxReferenceAppDelegate *appDelegate;
    IBOutlet UIImageView *imgBioLock;
}

@property (nonatomic, retain)  NSMutableArray* transactionlist;

@property (nonatomic, retain) IBOutlet UIImageView *imgBioLock;

- (void)change_lock_icon;

-(IBAction)indentityx_clicked:(id)sender;
-(IBAction)show_survey;

@end
