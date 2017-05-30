//
//  EnrollScreen.h
//  NavBased
//
//  Created by icore on 06/08/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IXAll.h"
#import "IdentityxReferenceAppDelegate.h"

@class ViewTransactions;

@interface EnrollScreen : UIViewController <IXServiceDelegate, IXTransactionDelegate, UIAlertViewDelegate>{

    IXService* service; // For IdentityX
    
	IBOutlet UIButton *btn_logout;
	NSMutableArray* transactionlist;
    IdentityxReferenceAppDelegate *appDelegate;
    IBOutlet UIActivityIndicatorView *actView;
    BOOL isEnrolled_and_Login;
       	
}


@property (nonatomic, retain)  NSMutableArray* transactionlist; // For IdentityX

@property (nonatomic, retain)UIActivityIndicatorView *actView;

@property (nonatomic, retain) UIButton *btn_logout;

@property (nonatomic, assign) BOOL isEnrolled_and_Login;


-(IBAction)Home_clicked:(id)sender;
-(IBAction)Logout_clicked:(id)sender;
- (void)showMessage:(NSString*)message;

- (IXTransaction*) verifyIdentityTransaction;

// For IdentityX
- (void)initialize;
- (void)refresh;
- (void)about;

@end
