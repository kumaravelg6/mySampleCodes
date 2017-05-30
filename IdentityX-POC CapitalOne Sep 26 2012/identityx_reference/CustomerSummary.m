//
//  CustomerSummary.m
//  NavBased
//
//  Created by icore on 07/08/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "CustomerSummary.h"


@implementation CustomerSummary

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
	[listOfItems addObject:@"Name"];
	[listOfItems addObject:@"A/C Number"];
	[listOfItems addObject:@"Address"];
	[listOfItems addObject:@"City, Zipcode"];
	[listOfItems addObject:@"Country"];
	[listOfItems addObject:@"Contact no"];
	[listOfItems addObject:@"Email"];
	[listOfItems addObject:@"Enrolled Verifications"];	
		
    [super viewDidLoad];
	
	tblview.backgroundColor = [UIColor clearColor];
    self.navigationItem.backBarButtonItem.title = @"Back";
    self.title  = @"Customer Summary";
}

/*
-(void)viewWillDisappear:(BOOL)animated
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
	
	//cell.text = cellValue;
    cell.textLabel.text = cellValue;
	
	
	if(indexPath.row == 0)
	{
		UILabel *lblName= [[[UILabel alloc] init] autorelease];
		[lblName setFont:[UIFont fontWithName:@"Arial" size:14]];
		//gDesc.font = [UIFont boldSystemFontOfSize:09.0f];
		lblName.frame = CGRectMake(220.0f, 15.0f, 80.0f, 12.0f);
		lblName.textColor = [UIColor darkGrayColor];
		lblName.backgroundColor = [UIColor clearColor];
		lblName.opaque = NO;
		lblName.text = @"John Doe";
		lblName.textAlignment = UITextAlignmentLeft;
		cell.clipsToBounds = YES;
		[cell.contentView addSubview:lblName];
		
	}
	else if(indexPath.row == 1)
	{
		UILabel *lblACCNum= [[[UILabel alloc] init] autorelease];
		[lblACCNum setFont:[UIFont fontWithName:@"Arial" size:14]];
		lblACCNum.frame = CGRectMake(220.0f, 15.0f, 80.0f, 12.0f);
		lblACCNum.textColor = [UIColor darkGrayColor];
		lblACCNum.backgroundColor = [UIColor clearColor];
		lblACCNum.opaque = NO;
		lblACCNum.text = @"4551 4545";
		lblACCNum.textAlignment = UITextAlignmentLeft;
		cell.clipsToBounds = YES;
		[cell.contentView addSubview:lblACCNum];
		
	}
	else if(indexPath.row == 2)
	{
		UILabel *lblAddress= [[[UILabel alloc] init] autorelease];
		[lblAddress setFont:[UIFont fontWithName:@"Arial" size:14]];
		//gDesc.font = [UIFont boldSystemFontOfSize:09.0f];
		lblAddress.frame = CGRectMake(215.0f, 15.0f, 80.0f, 12.0f);
		lblAddress.textColor = [UIColor darkGrayColor];
		lblAddress.backgroundColor = [UIColor clearColor];
		lblAddress.opaque = NO;
		lblAddress.text = @"12, Main St";
		lblAddress.textAlignment = UITextAlignmentLeft;
		cell.clipsToBounds = YES;
		[cell.contentView addSubview:lblAddress];
		
	}
	else if(indexPath.row == 3)
	{
		UILabel *lblCity = [[[UILabel alloc] init] autorelease];
		[lblCity setFont:[UIFont fontWithName:@"Arial" size:13]];
		lblCity.frame = CGRectMake(200.0f, 15.0f, 100.0f, 12.0f);
		lblCity.textColor = [UIColor darkGrayColor];
		lblCity.backgroundColor = [UIColor clearColor];
		lblCity.opaque = NO;
		lblCity.text = @"Newyork,98850";
		lblCity.textAlignment = UITextAlignmentLeft;
		cell.clipsToBounds = YES;
		[cell.contentView addSubview:lblCity];
	}
	else if(indexPath.row == 4)
	{
		UILabel *lblcountry= [[[UILabel alloc] init] autorelease];
		[lblcountry setFont:[UIFont fontWithName:@"Arial" size:13]];
		lblcountry.frame = CGRectMake(230.0f, 15.0f, 100.0f, 12.0f);
		lblcountry.textColor = [UIColor darkGrayColor];
		lblcountry.backgroundColor = [UIColor clearColor];
		lblcountry.opaque = NO;
		lblcountry.text = @"USA";
		lblcountry.textAlignment = UITextAlignmentLeft;
		cell.clipsToBounds = YES;
		[cell.contentView addSubview:lblcountry];
	}
	else if(indexPath.row == 5)
	{
		UILabel *lblphoneNo= [[[UILabel alloc] init] autorelease];
		[lblphoneNo setFont:[UIFont fontWithName:@"Arial" size:14]];
		lblphoneNo.frame = CGRectMake(200.0f, 15.0f, 100.0f, 12.0f);
		lblphoneNo.textColor = [UIColor darkGrayColor];
		lblphoneNo.backgroundColor = [UIColor clearColor];
		lblphoneNo.opaque = NO;
		lblphoneNo.text = @"854-454-1545";
		lblphoneNo.textAlignment = UITextAlignmentLeft;
		cell.clipsToBounds = YES;
		[cell.contentView addSubview:lblphoneNo];
	}
	else if(indexPath.row == 6)
	{
		UILabel *lblEmail = [[[UILabel alloc] init] autorelease];
		[lblEmail setFont:[UIFont fontWithName:@"Arial" size:14]];
		lblEmail.frame = CGRectMake(160.0f, 15.0f, 150.0f, 14.0f);
		lblEmail.textColor = [UIColor darkGrayColor];
		lblEmail.backgroundColor = [UIColor clearColor];
		lblEmail.opaque = NO;
		lblEmail.text = @"john123@gmail.com";
		lblEmail.textAlignment = UITextAlignmentLeft;
		cell.clipsToBounds = YES;
		[cell.contentView addSubview:lblEmail];
		
	}
	else if(indexPath.row == 7)
	{
		// Show arrow image
		UIImageView *imgArrow;
		imgArrow= [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"right-arrow.png"]];
		imgArrow.frame  = CGRectMake(270.0f, 15.0f, 9.0f, 13.0f);
		[cell.contentView addSubview:imgArrow];

	}
		
	return cell;
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
