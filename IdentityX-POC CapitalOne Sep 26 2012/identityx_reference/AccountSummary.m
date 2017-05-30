//
//  AccountSummary.m
//  NavBased
//
//  Created by icore on 06/08/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "AccountSummary.h"
//#import "RootViewController.h"
#import "RecentTransactions.h"

@implementation AccountSummary

@synthesize tblview;

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
    
	//Initialize the array.
	listOfItems = [[NSMutableArray alloc] init];
	
	//Add items
	[listOfItems addObject:@"Currrent Balance"];
	[listOfItems addObject:@"Recent transactions"];
	[listOfItems addObject:@"Available Credit"];
	[listOfItems addObject:@"Payment Due Date"];
	[listOfItems addObject:@"Minimum Payment"];
	[listOfItems addObject:@"Last Payment"];
	[listOfItems addObject:@"Rewards Balance"];	
	
    self.navigationItem.backBarButtonItem.title = @"Back";
	
    [super viewDidLoad];
	//[tblview setBackgroundColor:[[UIColor alloc] initWithRed:34.0f green:116.0f blue:174.0f alpha:0.1f]];
	tblview.backgroundColor = [UIColor clearColor];
    self.title  = @"Account Summary";
	
}

/*-(void)viewWillDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}*/

-(IBAction)Home_clicked:(id)sender
{
	[self.navigationController popToRootViewControllerAnimated:YES];
}

-(IBAction)Back_clicked:(id)sender
{
	[self.navigationController popViewControllerAnimated:YES];
}

-(IBAction)Logout_clicked:(id)sender
{
    [[NSUserDefaults standardUserDefaults] setObject:@"YES" forKey:@"is_logout"];
   [self.navigationController popToRootViewControllerAnimated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [listOfItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	static NSString *CellIdentifier = @"Cell";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil) {
		//cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
        cell = [[UITableViewCell alloc] initWithFrame:CGRectZero];
	}
	
	// Set up the cell...
	NSString *cellValue = [listOfItems objectAtIndex:indexPath.row];
	
	cell.textLabel.text = cellValue;
	
	
	if(indexPath.row == 0)
	{
		UILabel *lblBalance= [[[UILabel alloc] init] autorelease];
		[lblBalance setFont:[UIFont fontWithName:@"Arial" size:14]];
		//gDesc.font = [UIFont boldSystemFontOfSize:09.0f];
		lblBalance.frame = CGRectMake(230.0f, 15.0f, 80.0f, 12.0f);
		lblBalance.textColor = [UIColor darkGrayColor];
		lblBalance.backgroundColor = [UIColor clearColor];
		lblBalance.opaque = NO;
		lblBalance.text = @"$ 1254.00";
		lblBalance.textAlignment = UITextAlignmentLeft;
		cell.clipsToBounds = YES;
		[cell.contentView addSubview:lblBalance];
		
	}
	else if(indexPath.row == 1)
	{
		// Show arrow image
		UIImageView *imgArrow;
		imgArrow= [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"right-arrow.png"]];
		imgArrow.frame  = CGRectMake(270.0f, 15.0f, 9.0f, 13.0f);
		[cell.contentView addSubview:imgArrow];
		
		
	}
	else if(indexPath.row == 2)
	{
		UILabel *lblcredits= [[[UILabel alloc] init] autorelease];
		[lblcredits setFont:[UIFont fontWithName:@"Arial" size:14]];
		//gDesc.font = [UIFont boldSystemFontOfSize:09.0f];
		lblcredits.frame = CGRectMake(230.0f, 15.0f, 80.0f, 12.0f);
		lblcredits.textColor = [UIColor darkGrayColor];
		lblcredits.backgroundColor = [UIColor clearColor];
		lblcredits.opaque = NO;
		lblcredits.text = @"$ 594.50";
		lblcredits.textAlignment = UITextAlignmentLeft;
		cell.clipsToBounds = YES;
		[cell.contentView addSubview:lblcredits];
		
	}
	else if(indexPath.row == 3)
	{
		UILabel *lbldueDate= [[[UILabel alloc] init] autorelease];
		[lbldueDate setFont:[UIFont fontWithName:@"Arial" size:13]];
		//gDesc.font = [UIFont boldSystemFontOfSize:09.0f];
		lbldueDate.frame = CGRectMake(210.0f, 15.0f, 100.0f, 12.0f);
		lbldueDate.textColor = [UIColor darkGrayColor];
		lbldueDate.backgroundColor = [UIColor clearColor];
		lbldueDate.opaque = NO;
		lbldueDate.text = @"Aug, 15 2012";
		lbldueDate.textAlignment = UITextAlignmentLeft;
		cell.clipsToBounds = YES;
		[cell.contentView addSubview:lbldueDate];
	}
	else if(indexPath.row == 4)
	{
		UILabel *lblMinPmt= [[[UILabel alloc] init] autorelease];
		[lblMinPmt setFont:[UIFont fontWithName:@"Arial" size:14]];
		//gDesc.font = [UIFont boldSystemFontOfSize:09.0f];
		lblMinPmt.frame = CGRectMake(230.0f, 15.0f, 80.0f, 12.0f);
		lblMinPmt.textColor = [UIColor darkGrayColor];
		lblMinPmt.backgroundColor = [UIColor clearColor];
		lblMinPmt.opaque = NO;
		lblMinPmt.text = @"$ 60.00";
		lblMinPmt.textAlignment = UITextAlignmentLeft;
		cell.clipsToBounds = YES;
		[cell.contentView addSubview:lblMinPmt];
	}
	else if(indexPath.row == 5)
	{
		UILabel *lblLastPmt= [[[UILabel alloc] init] autorelease];
		[lblLastPmt setFont:[UIFont fontWithName:@"Arial" size:14]];
		//gDesc.font = [UIFont boldSystemFontOfSize:09.0f];
		lblLastPmt.frame = CGRectMake(230.0f, 10.0f, 80.0f, 14.0f);
		lblLastPmt.textColor = [UIColor darkGrayColor];
		lblLastPmt.backgroundColor = [UIColor clearColor];
		lblLastPmt.opaque = NO;
		lblLastPmt.text = @"$ 260.15";
		lblLastPmt.textAlignment = UITextAlignmentLeft;
		cell.clipsToBounds = YES;
		[cell.contentView addSubview:lblLastPmt];
		
		UILabel *lblLastPmtDate= [[[UILabel alloc] init] autorelease];
		[lblLastPmtDate setFont:[UIFont fontWithName:@"Arial" size:12]];
		//gDesc.font = [UIFont boldSystemFontOfSize:09.0f];
		lblLastPmtDate.frame = CGRectMake(220.0f, 24.0f, 100.0f, 14.0f);
		lblLastPmtDate.textColor = [UIColor darkGrayColor];
		lblLastPmtDate.backgroundColor = [UIColor clearColor];
		lblLastPmtDate.opaque = NO;
		lblLastPmtDate.text = @"July, 29 2012";
		lblLastPmtDate.textAlignment = UITextAlignmentLeft;
		cell.clipsToBounds = YES;
		[cell.contentView addSubview:lblLastPmtDate];
	}
	else if(indexPath.row == 6)
	{
		UILabel *lblRewards= [[[UILabel alloc] init] autorelease];
		[lblRewards setFont:[UIFont fontWithName:@"Arial" size:14]];
		//gDesc.font = [UIFont boldSystemFontOfSize:09.0f];
		lblRewards.frame = CGRectMake(230.0f, 15.0f, 80.0f, 12.0f);
		lblRewards.textColor = [UIColor darkGrayColor];
		lblRewards.backgroundColor = [UIColor clearColor];
		lblRewards.opaque = NO;
		lblRewards.text = @"$ 60.00";
		lblRewards.textAlignment = UITextAlignmentLeft;
		cell.clipsToBounds = YES;
		[cell.contentView addSubview:lblRewards];
	}
	
	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if(indexPath.row == 1)
	{
        RecentTransactions *ViewRecent = [[RecentTransactions alloc] initWithNibName:@"RecentTransactions" bundle:nil];
        [self.navigationController pushViewController:ViewRecent animated:YES];
        [ViewRecent release];

    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

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
