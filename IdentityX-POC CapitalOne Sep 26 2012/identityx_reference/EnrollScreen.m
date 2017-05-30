//
//  EnrollScreen.m
//  NavBased
//
//  Created by icore on 06/08/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//


#import "EnrollScreen.h"
#import "ViewTransactions.h"
#import "CaptureViewFactory.h"
#import "Constants.h"
#import "SecurityQA_Verify.h"


@implementation EnrollScreen

@synthesize transactionlist;
@synthesize btn_logout;
@synthesize actView;
@synthesize isEnrolled_and_Login;
//@synthesize isBackButtonSelected;

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
      
    appDelegate = (IdentityxReferenceAppDelegate *)[[UIApplication sharedApplication] delegate];

	service = appDelegate.service;
       
}


 - (void)viewDidAppear:(BOOL)animated
 {
    
     NSString* enrolled_userid = [[NSUserDefaults standardUserDefaults] objectForKey:@"enrolled_userid"];
     //if ([service isInitialized] && [service isEnrolled])
     if ([service isInitialized] && enrolled_userid!=nil)
     {
         if(self.isEnrolled_and_Login == YES)
         {
             self.isEnrolled_and_Login = NO;
             [self initialize];
         }
         else
             [self refresh];
     }
     else
     {
        [self initialize];
     }
 }

-(void)viewWillAppear:(BOOL)animated
{
    [actView startAnimating];
    self.navigationItem.hidesBackButton = TRUE; 

}
-(void)viewWillDisappear:(BOOL)animated
{
    [actView stopAnimating];
}

-(IBAction)Logout_clicked:(id)sender
{
		
	[[NSUserDefaults standardUserDefaults] setObject:@"YES" forKey:@"is_logout"];
    [self.navigationController popToRootViewControllerAnimated:YES];
	
	}

-(IBAction)Home_clicked:(id)sender
{
	[self.navigationController popToRootViewControllerAnimated:YES];
}

#pragma mark UITableView Delegate




#pragma other


- (void) showAlert:(NSString*)message
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Biometric Demo" 
                                                    message:message
												   delegate:nil 
                                          cancelButtonTitle:@"OK" 
                                          otherButtonTitles:nil];
    [alert setTag:0];
	[alert show];
	[alert release];
}

- (void) showAlertWithOffline:(NSString*)message
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Biometric Demo" 
                                                    message:message
												   delegate:self 
                                          cancelButtonTitle:@"OK" 
                                          otherButtonTitles:nil, nil];
	[alert setTag:1];
    [alert show];
    [alert release];
	
}


- (void) failedWithError:(NSError*)error
{
    
    NSLog(@"+++++++++ refreshTransactionList response with failure: +++++++++");
     self.navigationItem.hidesBackButton = FALSE; 
     [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    [self showAlertWithOffline:[error localizedDescription]];
}

- (void)initialize
{
    // IdentityX: Initialize
    //
    // To receive transactions and events from the IdentityX Service, an application 
    // have to implement the IXServiceListener interface.  The service will call 
    // initializeComplete if initialize was a success and initializedFailed otherwise. 
    
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    
    NSString* userid = [[NSUserDefaults standardUserDefaults] objectForKey:@"user.id"];
    
    NSLog(@"+++++++++ initialize starts : +++++++++");
     
    [service initialize:userid authURL:AUTH_URL dataURL:SVC_URL delegate:self];
    
    // If you are having problems with the certificate, try deleting it
    // [service removeCertificate];
}


- (void)refresh
{
    // If the service is initalized, refresh the transacation list. Otherwise
    // initialize the service.
    
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    
    if ([service isInitialized])
    {
        //[service refreshTransactionList];
        if (service.isEnrolled)
        {
            self.transactionlist = [NSMutableArray array];
            
            [self.transactionlist addObject:[self verifyIdentityTransaction]];
            
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
            
            IXTransaction* transaction = [self.transactionlist objectAtIndex:0];
            if (transaction != NULL)
            {
                CaptureViewController* controller = [CaptureViewFactory initalViewControllerForTransaction:transaction];
                if (controller != nil)
                {
                    [self.navigationController pushViewController:controller animated:YES];
                    [controller release];
                }
            }
            
        }
        else
        {

            NSLog(@"+++++++++ refreshTransactionList start:  +++++++++");
            [service refreshTransactionList];
        }
    }
    else
    {
        [self initialize];
    }
}

- (void) about
{
    NSString* userid = [[NSUserDefaults standardUserDefaults] objectForKey:@"user.id"];
    if (userid == nil)
        userid = @"NA";
    
    NSString* str = [NSString stringWithFormat:@"IdentityX Reference Application\n\nVersion 1.0\n\nCopyright (c) 2012 Daon, Inc.\nAll rights reserved\n\nUser ID\n%@", userid];
    
    [self showAlert:str];
}

#pragma mark In Band Transactions

- (IXTransaction*) verifyIdentityTransaction
{
   	// VERIFY_IDENTITY
    //
    // 1. Create a policy that matches the policy on the server, e.g. policyVerifyIdentityWithName:@"LOW".
    // 2. Set the required factors with requireXXX.
    // 3. Create the transaction based on the policy and the provider.
    
    if(appDelegate.actionFlag == 2)
    {
        if(appDelegate.stepup_actionFlag == 0)
        {
            
            IXPolicy* policy = [IXPolicy policyVerifyIdentityWithName:@"login"];
            [policy requireVoice];
            //[policy requirePalm];
            
            return [service transactionWithPolicy:policy provider:@"capitalone_poc" description:@"Verify Voice for Fund Transfer"];
        }
        else if(appDelegate.stepup_actionFlag == 1)
        {
            IXPolicy* policy = [IXPolicy policyVerifyIdentityWithName:@"step-up"];
            [policy requireFace];
            //[policy requirePalm];
            
            return [service transactionWithPolicy:policy provider:@"capitalone_poc" description:@"Verify Face for Fund Transfer"];
            
            
        }
        else if(appDelegate.stepup_actionFlag == 2)
        {
            
            IXPolicy* policy = [IXPolicy policyVerifyIdentityWithName:@"login-[palm"];
            [policy requirePalm];
            
            return [service transactionWithPolicy:policy provider:@"capitalone_poc" description:@"Verify Palm for Fund Transfer"];
        }
        else if(appDelegate.stepup_actionFlag == 3)
        {
            IXPolicy* policy = [IXPolicy policyVerifyIdentityWithName:@"login-pin"];
            [policy requirePIN];
                        
            return [service transactionWithPolicy:policy provider:@"capitalone_poc" description:@"Verify Pin for Fund Transfer"];
        }
    }
   
    else if(appDelegate.actionFlag == 1)
    {
        if(appDelegate.login_actionFlag == 0)
        {
            IXPolicy* policy = [IXPolicy policyVerifyIdentityWithName:@"login"];
            [policy requireVoice];
            return [service transactionWithPolicy:policy provider:@"capitalone_poc" description:@"Verify Voice for Login"];
        } 
        else if(appDelegate.login_actionFlag == 1)
        {
            IXPolicy* policy = [IXPolicy policyVerifyIdentityWithName:@"step-up"];
            [policy requireFace];
            //[policy requirePalm];
            
            return [service transactionWithPolicy:policy provider:@"capitalone_poc" description:@"Verify Face for Fund Transfer"];
        }
        else if(appDelegate.login_actionFlag == 2)
        {
            
            IXPolicy* policy = [IXPolicy policyVerifyIdentityWithName:@"login-[palm"];
            [policy requirePalm];
            
            return [service transactionWithPolicy:policy provider:@"capitalone_poc" description:@"Verify Palm for Fund Transfer"];
        }
        else if(appDelegate.login_actionFlag == 3)
        {
            IXPolicy* policy = [IXPolicy policyVerifyIdentityWithName:@"login-pin"];
            [policy requirePIN];
            
            return [service transactionWithPolicy:policy provider:@"capitalone_poc" description:@"Verify Pin for Fund Transfer"];
        }

    }
        
}

- (IXTransaction*) updateProfileTransaction
{
    // UPDATE_PROFILE
    
    IXPolicy* policy = [IXPolicy policyUpdateProfileWithName:@"L"];
    [policy requirePIN];
    
    return [service transactionWithPolicy:policy provider:@"Me" description:@"Update Profile"];
}


#pragma mark IXService Delegate

- (void) initializeComplete:(NSString*)user enrolled:(BOOL)isEnrolled
{
    // IdentityX: Initialize Complete
    //
    // The service has been initialized, call refreshTransactionsList to get a list of
    // pending transactions. The service will call transactionListReceived with a list 
    // of IXTransaction objects.  If the device is not enrolled the list will contain a 
    // single enroll transaction.

    NSLog(@"+++++++++ initialize ends with success : +++++++++");
  
     [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    [self refresh];
}

- (void) initializeFailed:(NSError*)error
{
    // IdentityX: Initialize Failed
    //
    // There are a number of reasons why initialize would fail:
    //
    // - Connection errors.
    // - Certificate installation errors
    // - The device could already be linked to a different profileID
    // - The user has been blocked
    //
    // Check the documentation for additional errors and error codes.
//    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
//    NSDateComponents *dateComponents = [gregorian components:(NSHourCalendarUnit  | NSMinuteCalendarUnit | NSSecondCalendarUnit) fromDate:[NSDate date]];
    NSLog(@"+++++++++ initialize ends with failure : +++++++++");
    //[gregorian release];
    
    self.navigationItem.hidesBackButton = FALSE; 
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    
    // Show the error message and allow the user to use offline mode, e.g. generate a
    // a Timed One Time Password, TOTP, based on the secret installed during initialization of
    // the IdentityX service.
    //
    // Note. For now we just assume that an error was due to connection issues. If the
    // the service initialization fails for any other reason, it may not be possible to
    // generate a TOTP.
    [self showAlertWithOffline:[error localizedDescription]];
    
    if(appDelegate.actionFlag == 0 || appDelegate.actionFlag == 1){
        [self.navigationController popToRootViewControllerAnimated:NO];
    }
    else
    {
        [self.navigationController popViewControllerAnimated:YES];
    }
   
   
}

- (void) transactionListReceived:(NSArray*)transactions
{
    NSLog(@"+++++++++ refreshTransactionList response with success: +++++++++");
    // IdentityX: Transaction List
    //
    // We got a list of transactions. If the device is enrolled the list will contain 0 or 
    // more transactions. If not enrolled the list will contain a single enroll transaction.
    
    self.transactionlist = [transactions mutableCopy];
    
    
    if(service.isEnrolled)
    {
        // VERIFY_IDENTITY and UPDATE_PROFILE
        // Note. For testing Verify Identity and Update Profile. 
             
        [self.transactionlist addObject:[self verifyIdentityTransaction]];
        
        self.title = @"Verify";
    
    }
    else
    {
        self.title = @"Enroll";
               
        appDelegate.actionFlag = 0;
        IXTransaction* transaction = [self.transactionlist objectAtIndex:0];
        NSString* userid = [[NSUserDefaults standardUserDefaults] objectForKey:@"user.id"];

        NSDictionary* params = [NSDictionary dictionaryWithObject:userid
                                                           forKey:[NSNumber numberWithInt:IXActionUserID]];
        NSLog(@"+++++++++ submit starts for Userid: +++++++++");
        [transaction submit:params delegate:self];
        


    }
    
               
}

#pragma mark IXTransaction Delegate

- (void)transaction:(IXTransaction*)transaction succeededWithResponse:(IXResponse*)response
{
    // IdentityX: Data submitted successfully
    //
    // The data was submitted to the service, so continue with the next capture screen. This
    // is also a good place to cancel any busy indicator.
    
     NSLog(@"+++++++++ submit ends with Success response : +++++++++");
    IXTransaction* transaction1 = [self.transactionlist objectAtIndex:0];
    if (transaction1 != NULL)
    {
        CaptureViewController* controller = [CaptureViewFactory initalViewControllerForTransaction:transaction1];
        if (controller != nil)
        {
            [self.navigationController pushViewController:controller animated:YES];
            [controller release];
        }
    }

       
}

- (void)transaction:(IXTransaction*)transaction failedWithError:(NSError*)error
{
    
    NSLog(@"+++++++++ submit ends with Failure response : +++++++++");
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    [self showMessage:[error localizedDescription]];
    // Move to Login Screen 
    NSArray* viewControllersInStack = self.navigationController.viewControllers;
    UIViewController* targetViewController = [viewControllersInStack objectAtIndex:[viewControllersInStack count]-4];
    [self.navigationController popToViewController:targetViewController animated:YES];
    
    // IdentityX: Submit error
    //
    // Data failed to submit or the data was not valid.
    
}

- (void)showMessage:(NSString*)message
{
    UIAlertView *alert = [[[UIAlertView alloc] initWithTitle:@"Biometric Demo" 
                                                    message:message
												   delegate:nil 
                                          cancelButtonTitle:@"OK" 
                                          otherButtonTitles:nil] autorelease];
	[alert show];
	//[alert release];
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
