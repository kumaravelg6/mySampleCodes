//
//  FundTransfer.h
//  NavBased
//
//  Created by icore on 07/08/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IdentityxReferenceAppDelegate.h"


@interface FundTransfer : UIViewController <UITextFieldDelegate> {

    IBOutlet UITextField *txt_accnumber;
    IBOutlet UITextField *txt_amount;
    IdentityxReferenceAppDelegate *appDelegate;
		
}

@property(nonatomic, retain)IBOutlet UITextField *txt_accnumber;
@property(nonatomic, retain)IBOutlet UITextField *txt_amount;

-(IBAction)Logout_clicked:(id)sender;
-(IBAction)Home_clicked:(id)sender;
-(IBAction)Back_clicked:(id)sender;

-(IBAction)BtnAdd_clicked:(id)sender;

-(NSString *)validate_add;

@end
