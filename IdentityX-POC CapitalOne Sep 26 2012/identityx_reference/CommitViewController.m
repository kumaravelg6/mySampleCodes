//
//  CommitViewController.m
//  identityx_reference
//
//  Created by Jonny Mortensen on 8/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CommitViewController.h"
#import "ViewTransactions.h"
#import "Choose_Login_action.h"
#import "FundTransfer.h"

@implementation CommitViewController

@synthesize Lbl_description;

- (void)dealloc
{
    [super dealloc];
}


#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    appDelegate = (IdentityxReferenceAppDelegate *)[[UIApplication sharedApplication] delegate];
    
    // Hides default back button
    self.navigationItem.hidesBackButton = YES; 
    // Remove previously added Back button
    self.navigationItem.leftBarButtonItem = nil; 
    // Remove previously added Done button
    self.navigationItem.rightBarButtonItem = nil; 
         
    //[self.navigationItem setLeftBarButtonItem:nil];
    //[self.navigationItem setRightBarButtonItem:nil];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewDidAppear:(BOOL)animated
{
    // IdentityX: Commit transaction
    //
    // Commit the transaction as soon as the view appears. You could
    // add a confirm button and a list of the collected items.
    
    [self setBusy:YES];

    
    if(appDelegate.actionFlag == 0)
    {
        self.title = @"Enrollment";
        Lbl_description.text = @"Verifying your enrollment information ...";
    }
    else
    {
        self.title = @"Verify";
        Lbl_description.text = @"Verifying your authentication information ...";
    }
    NSLog(@"+++++++++ Commit starts : +++++++++");
    
    [self.transaction commit:self];
}

#pragma mark IXTransaction Delegate

- (void) transaction:(IXTransaction*)transaction succeededWithResponse:(IXResponse*)response
{
    // IdentityX: Data submitted successfully
    //
    if(appDelegate.actionFlag == 2)
    {
        NSLog(@"Policy : stepup");
    }
    else if(appDelegate.actionFlag == 1)
    {
         NSLog(@"Policy : login-voice");
    }
    else
    {
         NSLog(@"Policy : enrolment");
    }

    
    NSLog(@"+++++++++Commit ends with Success response : +++++");
    
     [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    if ([transaction isEnrollment]) 
    {
        // If this is an enrollment, we are done. Show a message and return to
        // the transaction list.
         NSString* userid = [[NSUserDefaults standardUserDefaults] objectForKey:@"user.id"];
         [[NSUserDefaults standardUserDefaults] setObject:userid forKey:@"enrolled_userid"];
        
        [self showMessage:@"Enrollment has been completed successfully"];
        
        // Redirect to enroll screen for verification
              
        
        Choose_Login_action* Choose_Login_actionView = [[Choose_Login_action alloc] initWithNibName:@"Choose_Login_action" bundle:nil];
        Choose_Login_actionView.isEnrolled_and_Login = YES;
        [self.navigationController pushViewController:Choose_Login_actionView animated:YES];
        [Choose_Login_actionView release];
        

    }
    else
    {
        // This is a verification, so check the response. 
        
        if ([response isOneTimePassword]) 
        {
            // TODO
        }
        else if ([response isVirtualCard])
        {
            // TODO
        }
        else 
        {
            
            if(appDelegate.actionFlag == 2)
            {

                FundTransfer* viewFundTransfer = [[FundTransfer alloc] initWithNibName:@"FundTransfer" bundle:nil];
                [self.navigationController pushViewController:viewFundTransfer animated:YES];
                [viewFundTransfer release];
   
            }
            else
            {
                [[NSUserDefaults standardUserDefaults] setObject:@"NO" forKey:@"is_logout"];
                
                ViewTransactions* ViewTransactionsView = [[ViewTransactions alloc] initWithNibName:@"ViewTransactions" bundle:nil];
                [self.navigationController pushViewController:ViewTransactionsView animated:YES];
                [ViewTransactionsView release];
            }

            
        }
    }
}

- (void)transaction:(IXTransaction*)transaction failedWithError:(NSError*)error
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    // IdentityX: Commit failed.
    
    
    NSLog(@"+++++++++ Commit ends with Failure response : +++++++++");
   
    // Something went wrong. You can check the error code to better guide the user.
   
    [super transaction:transaction failedWithError:error];
    NSLog(@" Error code : %d %@",[error code],[error description]);
    
    if(appDelegate.actionFlag == 0){
        [self.navigationController popToRootViewControllerAnimated:NO];
    }
    else if(appDelegate.actionFlag == 1)
    {

        [self.navigationController popToRootViewControllerAnimated:NO];

        
    }
    else
    {
        // Face failure case redirect to landing page ie, account summary, customer summary,etc..
        
        NSArray* viewControllersInStack = self.navigationController.viewControllers;
        UIViewController* targetViewController = [viewControllersInStack objectAtIndex:[viewControllersInStack count]-4];
        
       [self.navigationController popToViewController:targetViewController animated:YES];
    }
}


@end
