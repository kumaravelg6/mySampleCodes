//
//  TransactionViewController.m
//  identityx_template
//
//  Created by Jonny Mortensen on 8/24/11.
//  Copyright 2011 Daon. All rights reserved.
//

#import "TransactionListViewController.h"
#import "CaptureViewFactory.h"
#import "EnrollScreen.h"
#import "Choose_Login_action.h"
#import "LoginScreen.h"
#import "Constants.h"
#import "SurveyView.h"
#import "IdentityxReferenceAppDelegate.h"


@implementation TransactionListViewController

@synthesize transactionlist;
@synthesize imgBioLock;


#pragma mark - View lifecycle

//
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.

- (void)viewDidLoad
{
    [super viewDidLoad];
    appDelegate = (IdentityxReferenceAppDelegate *)[[UIApplication sharedApplication] delegate];
    appDelegate.actionFlag = 1;
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:0.129 green:0.451 blue:0.678 alpha:1];
   
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    
       
    // IdentityX:
    //
    // To receive transactions and events from the IdentityX Service, an application 
    // have to implement the IXServiceListener interface.  The service will call 
    // initializeComplete if initialize was a success and initializedFailed otherwise. 
    
        
}
-(IBAction)show_survey
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

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}
-(void)viewWillAppear:(BOOL)animated
{
    [self change_lock_icon];
    appDelegate.actionFlag = 1;
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark Custom Handlers

-(IBAction)indentityx_clicked:(id)sender
{

    NSString* enrolled_userid = [[NSUserDefaults standardUserDefaults] objectForKey:@"enrolled_userid"];
    if(enrolled_userid != nil)
    {
        // Redirect to Login options list
        Choose_Login_action* Choose_Login_actionView = [[Choose_Login_action alloc] initWithNibName:@"Choose_Login_action" bundle:nil];
        [self.navigationController pushViewController:Choose_Login_actionView animated:YES];
        [Choose_Login_actionView release];
        
    }
    else
    {
        LoginScreen* LoginView = [[LoginScreen alloc] initWithNibName:@"LoginScreen" bundle:nil];
        [self.navigationController pushViewController:LoginView animated:YES];
        [LoginView release];
    }
       
}

-(void)change_lock_icon
{
     NSString* is_logout = [[NSUserDefaults standardUserDefaults] objectForKey:@"is_logout"];
    if([is_logout isEqualToString:@"NO"])
    {
        [imgBioLock setImage:[UIImage imageNamed:@"open_lock.png"]];
    }
    else
    {
        [imgBioLock setImage:[UIImage imageNamed:@"lock.png"]];
    }
}
#pragma mark UITableView Delegate


- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}



@end
