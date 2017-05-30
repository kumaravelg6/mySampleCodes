//
//  Choose_Login_action.m
//  identityx_reference
//
//  Created by GLOBAL on 9/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Choose_Login_action.h"
#import "EnrollScreen.h"

@implementation Choose_Login_action

@synthesize tblView;
@synthesize isEnrolled_and_Login;

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    appDelegate = (IdentityxReferenceAppDelegate *)[[UIApplication sharedApplication] delegate];
    
    login_options = [[NSMutableArray alloc] init];
    
    //Add stepup options to array
    [login_options addObject:@"Voice Authentication"];
    [login_options addObject:@"Face Authentication"];
    [login_options addObject:@"Palm Authentication"];
    [login_options addObject:@"PIN Authentication"];
    
    self.title = @"Login Authentication";

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

-(void)viewWillAppear:(BOOL)animated
{
    if(self.isEnrolled_and_Login == YES)
    [self.navigationItem setHidesBackButton:YES animated:YES];

}

#pragma mark UITableView Delegate


//
// Customize the number of sections in the table view.

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [login_options count];
}

//
// Customize the appearance of table view cells.


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
    
    if ([login_options count] > 0)
    {
        
        cell.textLabel.text = [login_options objectAtIndex:indexPath.row];
        
        if(indexPath.row != 0)        
        {
            cell.userInteractionEnabled = NO;
            cell.textLabel.textColor = [UIColor lightGrayColor];
        }
        
    }
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    appDelegate.actionFlag = 1; // Setting the action flag to Login
    
    if([indexPath row]==0)
    {
        appDelegate.login_actionFlag = 0 ; 
    }
    else if([indexPath row]==1)
    {
        appDelegate.login_actionFlag = 1;
    }
    else if([indexPath row]==2)
    {
        appDelegate.login_actionFlag = 2;
    }
    else if([indexPath row]==3)
    {
        appDelegate.login_actionFlag = 3;
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    EnrollScreen* EnrollView = [[EnrollScreen alloc] initWithNibName:@"EnrollScreen" bundle:nil];
    if(self.isEnrolled_and_Login == YES)
        EnrollView.isEnrolled_and_Login = YES;
    [self.navigationController pushViewController:EnrollView animated:YES];
    [EnrollView release];
    
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
