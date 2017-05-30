//
//  Choose_StepUp_action.m
//  identityx_reference
//
//  Created by GLOBAL on 8/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Choose_StepUp_action.h"
#import "EnrollScreen.h"

@implementation Choose_StepUp_action

@synthesize tblView;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
     
    appDelegate = (IdentityxReferenceAppDelegate *)[[UIApplication sharedApplication] delegate];
    
    stepup_options = [[NSMutableArray alloc] init];
    
    //Add stepup options to array
    [stepup_options addObject:@"Voice Authentication"];
    [stepup_options addObject:@"Face Authentication"];
    [stepup_options addObject:@"Palm Authentication"];
    [stepup_options addObject:@"PIN Authentication"];
    self.title = @"Additional Verification";
   
}

-(void)viewWillAppear:(BOOL)animated
{
    self.title = @"Additional Verification";
        
}


-(void)viewWillDisappear:(BOOL)animated
{
       
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


#pragma mark UITableView Delegate


//
// Customize the number of sections in the table view.

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
 {
 return 1;
 }
 
 - (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
 {
 return [stepup_options count];
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
 
     if ([stepup_options count] > 0)
     {
  
         cell.textLabel.text = [stepup_options objectAtIndex:indexPath.row];
         
         if(indexPath.row == 2)
         {
             cell.userInteractionEnabled = NO;
             cell.textLabel.textColor = [UIColor lightGrayColor];
         }
         
     }
 
     return cell;
 }


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"Selected row : %d",[indexPath row]);

    appDelegate.actionFlag = 2; // Setting the action flag to stepup
    
    if([indexPath row]==0)
    {
        appDelegate.stepup_actionFlag = 0 ; 
    }
    else if([indexPath row]==1)
    {
        appDelegate.stepup_actionFlag = 1;
    }
    else if([indexPath row]==2)
    {
        appDelegate.stepup_actionFlag = 2;
    }
    else if([indexPath row]==3)
    {
        appDelegate.stepup_actionFlag = 3;
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    EnrollScreen* EnrollView = [[EnrollScreen alloc] initWithNibName:@"EnrollScreen" bundle:nil];
    [self.navigationController pushViewController:EnrollView animated:YES];
    [EnrollView release];
    
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

#pragma mark - View lifecycle



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

-(void)dealloc
{
    [stepup_options release];
    [super dealloc];
}

@end
