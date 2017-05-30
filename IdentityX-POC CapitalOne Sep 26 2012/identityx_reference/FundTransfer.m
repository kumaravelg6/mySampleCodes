//
//  FundTransfer.m
//  NavBased
//
//  Created by icore on 07/08/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "FundTransfer.h"
#import "FundTransferSuccess.h"


@implementation FundTransfer

@synthesize txt_accnumber, txt_amount;

 // Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
 - (void)viewDidLoad {
     
     txt_accnumber.clearButtonMode = UITextFieldViewModeWhileEditing;
     txt_amount.clearButtonMode = UITextFieldViewModeWhileEditing;
     appDelegate = (IdentityxReferenceAppDelegate *)[[UIApplication sharedApplication] delegate];
     self.title = @"Add Bill payee";
    
     UIBarButtonItem *backButton = [[UIBarButtonItem alloc] 
                                    initWithTitle: @"Back" 
                                    style:UIBarButtonItemStylePlain 
                                    target:self 
                                    action:@selector(back_barbutton_clicked)];
     self.navigationItem.leftBarButtonItem = backButton;
     
     [backButton release];

     [super viewDidLoad];
     
 }
 

- (void)back_barbutton_clicked
{
    // not reaching here
    NSLog(@"handleBack event reached");
    appDelegate.actionFlag = 1;
    
    NSArray* viewControllersInStack = self.navigationController.viewControllers;
    UIViewController* targetViewController;
    NSString* enrolled_userid = [[NSUserDefaults standardUserDefaults] objectForKey:@"enrolled_userid"];
    if(enrolled_userid == nil)
    {
        // Go to previous screen
        targetViewController = [viewControllersInStack objectAtIndex:[viewControllersInStack count]-2];
    }
    else
    {
        // Go to landing page 
        targetViewController = [viewControllersInStack objectAtIndex:[viewControllersInStack count]-5];
    }
 
     [self.navigationController popToViewController:targetViewController animated:YES];
}


-(IBAction)Home_clicked:(id)sender
{
	[self.navigationController popToRootViewControllerAnimated:YES];
}

-(IBAction)Back_clicked:(id)sender
{
	[self.navigationController popViewControllerAnimated:YES];
}

-(IBAction)BtnAdd_clicked:(id)sender
{
    NSString *err_chk = [self validate_add];
	
		
	if([err_chk isEqualToString:@"0"])
	{

        // Redirect to Fund transfer successview
        FundTransferSuccess* FundTransferSuccessView = [[FundTransferSuccess alloc] initWithNibName:@"FundTransferSuccess" bundle:nil];
        [self.navigationController pushViewController:FundTransferSuccessView animated:YES];
        [FundTransferSuccessView release];
        
    }

}

-(IBAction)Logout_clicked:(id)sender
{
    [[NSUserDefaults standardUserDefaults] setObject:@"YES" forKey:@"is_logout"];
	[self.navigationController popToRootViewControllerAnimated:YES];
}

-(void)show_alert:(NSString *)msg
{
	UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Alert!" message:msg delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
	[alertView show];
	[alertView release];
}

-(NSString *)validate_add
{
	NSString *err_flag = @"0";
	
	if([[txt_accnumber text] length]==0)
	{
		[self show_alert:@"Please enter account number"];	
		err_flag = @"1";
	}
	else if([[txt_amount text] length]==0)
	{
		
		[self show_alert:@"Please enter amount"];
		err_flag = @"1";
	}
	return err_flag;
	
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
	if (textField == txt_accnumber) {
		[txt_accnumber resignFirstResponder];
		
	}
	if (textField == txt_amount) {
		[txt_amount resignFirstResponder];
		
	}
	return YES;
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	[txt_accnumber resignFirstResponder];
	[txt_amount resignFirstResponder];
}


/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/



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
