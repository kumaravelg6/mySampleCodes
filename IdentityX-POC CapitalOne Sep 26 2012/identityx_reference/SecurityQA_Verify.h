//
//  SecurityQA_Verify.h
//  identityx_reference
//
//  Created by GLOBAL on 8/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IXAll.h"

@interface SecurityQA_Verify : UIViewController <UITextFieldDelegate>
{
    IBOutlet UIButton *btnLogin;
    IBOutlet UITextField *txtAnswer;
    BOOL isAddBillPayee;
    NSMutableArray* transactionlist;
}
@property (nonatomic, retain)  NSMutableArray* transactionlist; // For IdentityX
@property(nonatomic, retain)IBOutlet UIButton *btnLogin;
@property(nonatomic, retain)IBOutlet UITextField *txtAnswer;

@property(nonatomic, assign)BOOL isAddBillPayee;

-(IBAction)Login_clicked:(id)sender;
-(IBAction)Home_clicked:(id)sender;

@end
