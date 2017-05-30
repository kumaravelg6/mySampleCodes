//
//  LoginScreen.m
//  NavBased
//
//  Created by icore on 08/08/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "LoginScreen.h"
#import "CaptureViewFactory.h"
#import "ViewTransactions.h"
#import "EnrollScreen.h"


#import "Constants.h"


@implementation LoginScreen



@synthesize txt_username, txt_password;
@synthesize btn_login;


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	self.title = @"Login";
	txt_username.clearButtonMode = UITextFieldViewModeWhileEditing;
	txt_password.clearButtonMode = UITextFieldViewModeWhileEditing;
	self.navigationController.navigationBar.hidden = NO;
       
    [super viewDidLoad];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

/*
- (void)viewDidAppear:(BOOL)animated
{
    //self.navigationController.navigationBar.hidden = YES;
    
    if ([service isInitialized] && [service isEnrolled])
    {
        [self refresh];
    }
    else
    {
        [self initialize];
    }
}*/



-(IBAction)Login_clicked:(id)sender
{
	
	NSString *err_chk = [self validate_login];
	
	
	if([err_chk isEqualToString:@"0"])
	{
		 [[NSUserDefaults standardUserDefaults] setObject:txt_username.text forKey:@"user.id"];
        
         			
			[txt_username resignFirstResponder];
			[txt_password resignFirstResponder];
        
        NSString* enrolled_userid = [[NSUserDefaults standardUserDefaults] objectForKey:@"enrolled_userid"];
        
        if(enrolled_userid == nil)
        {
            txt_username.text = @"";
            txt_password.text = @"";

            ViewTransactions* ViewTransactionsView = [[ViewTransactions alloc] initWithNibName:@"ViewTransactions" bundle:nil];
            [self.navigationController pushViewController:ViewTransactionsView animated:YES];
            [ViewTransactionsView release];
            
            
        }
        else
        {
            EnrollScreen* EnrollView = [[EnrollScreen alloc] initWithNibName:@"EnrollScreen" bundle:nil];
            [self.navigationController pushViewController:EnrollView animated:YES];
            [EnrollView release];

        }
    }
	
}


-(IBAction)Home_clicked:(id)sender
{
	[self.navigationController popToRootViewControllerAnimated:YES];
    
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
	if (textField == txt_username) {
		[txt_username resignFirstResponder];
		
	}
	if (textField == txt_password) {
		[txt_password resignFirstResponder];
		
	}
	return YES;
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	[txt_username resignFirstResponder];
	[txt_password resignFirstResponder];
}

-(void)show_alert:(NSString *)msg
{
	UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Alert!" message:msg delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
	[alertView show];
	[alertView release];
}

-(NSString *)validate_login
{
	NSString *err_flag = @"0";
	
	if([[txt_username text] length]==0)
	{
		[self show_alert:@"Please enter username"];	
		err_flag = @"1";
	}
	else if([[txt_password text] length]==0)
	{
		
		[self show_alert:@"Please enter password"];
		err_flag = @"1";
	}
	return err_flag;
	
}


//-(void)viewWillDisappear:(BOOL)animated
//{
//    //[self.navigationController removeFromParentViewController];
//    [self.navigationController popViewControllerAnimated:NO];
//}

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
