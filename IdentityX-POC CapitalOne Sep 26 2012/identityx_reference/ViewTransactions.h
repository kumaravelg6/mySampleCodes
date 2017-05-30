//
//  ViewTransactions.h
//  NavBased
//
//  Created by icore on 02/08/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IdentityxReferenceAppDelegate.h"

@class AccountSummary;
@class CustomerSummary;
@class FundTransfer;

@interface ViewTransactions : UIViewController<UIAlertViewDelegate> {

	IdentityxReferenceAppDelegate *appDelegate;
    IBOutlet UIButton *btn_enrollment;
    IBOutlet UILabel *lbl_enroll;
}


@property(nonatomic, retain)IBOutlet UIButton *btn_enrollment;
@property(nonatomic, retain)IBOutlet UILabel *lbl_enroll;

-(IBAction)account_summary_clicked:(id)sender;
-(IBAction)customer_summary_clicked:(id)sender;
-(IBAction)fund_transfer_clicked:(id)sender;
-(IBAction)enrollment_clicked:(id)sender;

-(IBAction)Home_clicked:(id)sender;
-(IBAction)Logout_clicked:(id)sender;

@end
