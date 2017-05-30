//
//  RecentTransactions.m
//  NavBased
//
//  Created by icore on 07/08/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "RecentTransactions.h"


@implementation RecentTransactions

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
	[listOfItems addObject:[NSArray arrayWithObjects:@"6-08-2012",@"Description 1",@"$ 50.00",@"CR",nil]];
	[listOfItems addObject:[NSArray arrayWithObjects:@"5-08-2012",@"Description 2",@"$ 25.00",@"DR",nil]];
	[listOfItems addObject:[NSArray arrayWithObjects:@"5-08-2012",@"Description 3",@"$ 150.50",@"CR",nil]];
	[listOfItems addObject:[NSArray arrayWithObjects:@"2-08-2012",@"Description 4",@"$ 23.50",@"DR",nil]];
	[listOfItems addObject:[NSArray arrayWithObjects:@"30-07-2012",@"Description 5",@"$ 50.00",@"DR",nil]];
	[listOfItems addObject:[NSArray arrayWithObjects:@"25-07-2012",@"Description 6",@"$ 65.00",@"CR",nil]];

	self.title = @"Recent Transactions";
    [super viewDidLoad];
}

-(IBAction)Home_clicked:(id)sender
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
	//NSString *cellValue = [listOfItems objectAtIndex:indexPath.row];
    NSArray *rowData = [listOfItems objectAtIndex:indexPath.row];
	
	cell.textLabel.text = [rowData objectAtIndex:0];
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
