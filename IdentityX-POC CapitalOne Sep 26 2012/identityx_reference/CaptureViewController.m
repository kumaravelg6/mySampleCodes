//
//  CaptureViewController.m
//  identityx_reference
//
//  Created by Jonny Mortensen on 8/29/11.
//  Copyright 2011 Daon. All rights reserved.
//

#import "CaptureViewController.h"
#import "CaptureViewFactory.h"

// This is the base class for all screens that needs to capture and submit data. All the
// capture screen has to do more or less the same thing. Collect the data, submit it, and
// check the IXTransactionDelegate for success or fail. If success, continue to the next
// screen. If the submission failed, show an error.


@implementation CaptureViewController

@synthesize transaction;
@synthesize stepIndex;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) 
    {
        // Add a Done button to the navigation bar. The button is disabled by
        // default and can enabled whenever the data is ready for submission.
        
        // Hides default back button
        self.navigationItem.hidesBackButton = YES; 
        doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" 
                                                        style:UIBarButtonItemStyleBordered
                                                       target:self 
                                                       action:@selector(done)];
        doneButton.enabled = NO; 				
        [self.navigationItem setRightBarButtonItem:doneButton animated:NO];
        [doneButton release]; 
        
        self.navigationItem.leftBarButtonItem = nil;
        UIBarButtonItem *backButton = [[UIBarButtonItem alloc] 
                                       initWithTitle: @"Back" 
                                       style:UIBarButtonItemStylePlain 
                                       target:self 
                                       action:@selector(back)];
        self.navigationItem.leftBarButtonItem = backButton;
        [backButton release];
        
             
    }
    return self;
}

- (id)initWithTitle:(NSString*)title transaction:(IXTransaction*)transaction
{
    [self setBusy:NO];
    self = [super init];
    if (self)
    {
        self.navigationItem.title = title;
        self.transaction = transaction;
        
    }
    return self;

}


- (void)dealloc
{
    [transaction release];
    
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle



- (void)viewDidUnload
{
    [super viewDidUnload];
    
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark 



- (void)showMessage:(NSString*)message
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Biometric Demo" 
                                                    message:message
												   delegate:nil 
                                          cancelButtonTitle:@"OK" 
                                          otherButtonTitles:nil];
	[alert show];
	[alert release];
}

- (void)setBusy:(BOOL)busy
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:busy];
}

#pragma mark

- (IBAction)done
{    
}
- (IBAction)back
{    
}

- (void)back_barbutton_clicked
{

    if(self.stepIndex == 1)
    {
        NSArray* viewControllersInStack = self.navigationController.viewControllers;
        UIViewController* targetViewController;
        // Go to landing page 
        targetViewController = [viewControllersInStack objectAtIndex:[viewControllersInStack count]-3];
        [self.navigationController popToViewController:targetViewController animated:YES];
    }
    else
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)submit:(NSDictionary*)params
{
    // IdentityX: Submit 
    //
    // Submit the captured data to the service. The submit method takes a key-value 
    // dictionary and an event listener.  The key is the action and the value the data, 
    // e.g. a string, a byte array etc.
    //

    [self setBusy:YES];
   
   
    
    [transaction submit:params delegate:self];
}

#pragma mark IXTransaction Delegate

- (void)transaction:(IXTransaction*)transaction succeededWithResponse:(IXResponse*)response
{
    // IdentityX: Data submitted successfully
    //
    // The data was submitted to the service, so continue with the next capture screen. This
    // is also a good place to cancel any busy indicator.
    NSLog(@"Policy : %@ on Success", [[transaction policy] policyIdentifier]);

    NSLog(@"+++++++++ submit ends with Success response : +++++++++");
    
    [self setBusy:NO];
    
    CaptureViewController* controller = [CaptureViewFactory viewControllerForTransaction:self.transaction 
                                                                         followingAction:[self.transaction action]];
    if (controller != nil)
    {
        [self.navigationController pushViewController:controller animated:YES];
        [controller release];
    }

}

- (void)transaction:(IXTransaction*)transaction failedWithError:(NSError*)error
{
    

    NSLog(@"+++++++++ submit ends with failure response : +++++++++");
    // IdentityX: Submit error
    //
    // Data failed to submit or the data was not valid.
    
    [self setBusy:NO];
    
    [self showMessage:[error localizedDescription]];
}

@end
