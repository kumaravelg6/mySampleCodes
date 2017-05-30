//
//  FundTransferSuccess.m
//  identityx_reference
//
//  Created by GLOBAL on 9/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FundTransferSuccess.h"
#import "SurveyView.h"

@implementation FundTransferSuccess


#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title  = @"Info";
    // Do any additional setup after loading the view from its nib.
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

-(IBAction)participate_survey_clicked:(id)sender
{
    SurveyView *ViewSurveyView = [[SurveyView alloc] initWithNibName:@"SurveyView" bundle:nil];
	[self.navigationController pushViewController:ViewSurveyView animated:YES];
	[ViewSurveyView release];
}



- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
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


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
