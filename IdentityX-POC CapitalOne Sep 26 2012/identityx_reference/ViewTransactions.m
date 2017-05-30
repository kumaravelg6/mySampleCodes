//
//  ViewTransactions.m
//  NavBased
//
//  Created by icore on 02/08/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewTransactions.h"
#import "AccountSummary.h"
#import "CustomerSummary.h"
#import "Choose_StepUp_action.h"
#import "SecurityQA_Verify.h"

@implementation ViewTransactions

@synthesize btn_enrollment, lbl_enroll;

//@synthesize AccountSummaryObj;

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
    appDelegate = (IdentityxReferenceAppDelegate *)[[UIApplication sharedApplication] delegate];
    [super viewDidLoad];
    self.title = @"Menu";
	
    
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

-(void)viewWillAppear:(BOOL)animated
{
    NSString* enrolled_userid = [[NSUserDefaults standardUserDefaults] objectForKey:@"enrolled_userid"];
    
    if(enrolled_userid != nil)
    {
        btn_enrollment.hidden = YES;
        lbl_enroll.hidden = YES; 
    }
    else
    {
        btn_enrollment.hidden = NO;
        lbl_enroll.hidden = NO;
    }
    
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}


-(IBAction)account_summary_clicked:(id)sender
{
	
	
	AccountSummary *ViewACsummary = [[AccountSummary alloc] initWithNibName:@"AccountSummary" bundle:nil];
	[self.navigationController pushViewController:ViewACsummary animated:YES];
	[ViewACsummary release];
	
}

-(IBAction)customer_summary_clicked:(id)sender
{
	CustomerSummary *ViewCustomerSummary = [[CustomerSummary alloc] initWithNibName:@"CustomerSummary" bundle:nil];
	[self.navigationController pushViewController:ViewCustomerSummary animated:YES];
	[ViewCustomerSummary release];
}

-(IBAction)fund_transfer_clicked:(id)sender
{
    
        
    // Redirect to Enrollview
     NSString* enrolled_userid = [[NSUserDefaults standardUserDefaults] objectForKey:@"enrolled_userid"];
    if(enrolled_userid == nil)
    {
        SecurityQA_Verify* SecurityQAverify = [[SecurityQA_Verify alloc] initWithNibName:@"SecurityQA_Verify" bundle:nil];
        SecurityQAverify.isAddBillPayee = YES;
        [self.navigationController pushViewController:SecurityQAverify animated:YES];
        [SecurityQAverify release];

    }
    else
    {
        Choose_StepUp_action *choose_stepupView = [[Choose_StepUp_action alloc] initWithNibName:@"Choose_StepUp_action" bundle:nil];
        [self.navigationController pushViewController:choose_stepupView animated:YES];
        [choose_stepupView release];
    }
    
   
}

-(IBAction)enrollment_clicked:(id)sender
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Biometric Demo" message:@"Are you sure to Enroll in Biometric program?" delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil];
    [alertView setTag:10];
    [alertView show];
    [alertView release];
    
}


-(IBAction)Home_clicked:(id)sender
{
	[self.navigationController popToRootViewControllerAnimated:YES];
}

-(IBAction)Logout_clicked:(id)sender
{
    [[NSUserDefaults standardUserDefaults] setObject:@"YES" forKey:@"is_logout"];
    [self.navigationController popToRootViewControllerAnimated:YES];
}
/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    // To handle YES - Index 1, NO - Index 0 
    if (buttonIndex == 1 && alertView.tag == 10) 
    {
        // Redirect to Security QA for verification
        SecurityQA_Verify* SecurityQAverify = [[SecurityQA_Verify alloc] initWithNibName:@"SecurityQA_Verify" bundle:nil];
        [self.navigationController pushViewController:SecurityQAverify animated:YES];
        [SecurityQAverify release];
    }
}

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
