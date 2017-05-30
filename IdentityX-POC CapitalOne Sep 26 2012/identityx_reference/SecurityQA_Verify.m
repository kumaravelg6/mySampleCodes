//
//  SecurityQA_Verify.m
//  identityx_reference
//
//  Created by GLOBAL on 8/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SecurityQA_Verify.h"
#import "EnrollScreen.h"
#import "CaptureViewFactory.h"
#import "FundTransfer.h"

@implementation SecurityQA_Verify

@synthesize btnLogin;
@synthesize txtAnswer;
@synthesize transactionlist;
@synthesize isAddBillPayee;

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    txtAnswer.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.title = @"Security Q&A Verify";
    // Do any additional setup after loading the view from its nib.
}

-(IBAction)Login_clicked:(id)sender
{
    [[NSUserDefaults standardUserDefaults] setObject:txtAnswer.text forKey:@"SecurityAnswer"];
    NSString* userid = [[NSUserDefaults standardUserDefaults] objectForKey:@"user.id"];
    [[NSUserDefaults standardUserDefaults] setObject:userid forKey:@"Answered_userid"];

       
    if([txtAnswer.text length]>0)
    {
        if(isAddBillPayee == YES)
        {
            FundTransfer *ViewFundTransfer = [[FundTransfer alloc] initWithNibName:@"FundTransfer" bundle:nil];
            [self.navigationController pushViewController:ViewFundTransfer animated:YES];
            [ViewFundTransfer release];

        }
        else 
        {
            EnrollScreen* EnrollView = [[EnrollScreen alloc] initWithNibName:@"EnrollScreen" bundle:nil];
            [self.navigationController pushViewController:EnrollView animated:YES];
            [EnrollView release];
    
        }
                
    }else
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Alert!" message:@"Please enter correct security answer." delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
        [alertView show];
        [alertView release];
        [txtAnswer becomeFirstResponder];
    }


}

-(IBAction)Home_clicked:(id)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
	if (textField == txtAnswer) {
		[txtAnswer resignFirstResponder];
		
	}
	return YES;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	[txtAnswer resignFirstResponder];
}



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

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}


@end
