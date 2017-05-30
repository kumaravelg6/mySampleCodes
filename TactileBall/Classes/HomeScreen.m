//
//  HomeScreen.m
//  AnimationTest
//
//  Created by Galaxy Weblinks on 12/08/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "HomeScreen.h"
#import "Instructions.h"
//#import "AnimationTestAppDelegate.h"
#import "AnimationTestViewController.h"


@implementation HomeScreen

@synthesize btnPlay,btnHelp;
@synthesize toolbar;
/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

- (void)viewDidLoad {
    [super viewDidLoad];
    // Uncomment the following line to add the Edit button to the navigation bar.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
	
	self.title = @"Tactile Ball";
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
	
	//Initialize the toolbar
	toolbar = [[UIToolbar alloc] init];
	toolbar.barStyle = UIBarStyleDefault;
	
	//Set the toolbar to fit the width of the app.
	[toolbar sizeToFit];
	
	//Caclulate the height of the toolbar
	CGFloat toolbarHeight = [toolbar frame].size.height;
	
	//Get the bounds of the parent view
	CGRect rootViewBounds = self.parentViewController.view.bounds;
	
	//Get the height of the parent view.
	CGFloat rootViewHeight = CGRectGetHeight(rootViewBounds);
	
	//Get the width of the parent view,
	CGFloat rootViewWidth = CGRectGetWidth(rootViewBounds);
	
	//Create a rectangle for the toolbar
	CGRect rectArea = CGRectMake(0, rootViewHeight - toolbarHeight, rootViewWidth, toolbarHeight);
	
	//Reposition and resize the receiver
	[toolbar setFrame:rectArea];
	
	//Create a button
	UIBarButtonItem *infoButton = [[UIBarButtonItem alloc] 
								   initWithTitle:@"Info" style:UIBarButtonItemStyleBordered target:self action:@selector(info_clicked:)];
	
	[toolbar setItems:[NSArray arrayWithObjects:infoButton,nil]];
	
	//Add the toolbar as a subview to the navigation controller.
	[self.navigationController.view addSubview:toolbar];
}


- (IBAction) info_clicked:(id)sender {
	
	//Initialize the Info View Controller
	if(ivControllerToolbar == nil)
		ivControllerToolbar = [[Instructions alloc] initWithNibName:@"Instructions" bundle:[NSBundle mainBundle]];
	
	ivControllerToolbar.isViewPushed = NO;
	
	//Initialize the navigation controller with the info view controller
	if(infoNavController == nil)
		infoNavController = [[UINavigationController alloc] initWithRootViewController:ivControllerToolbar];
	
	//Present the navigation controller.
	[self.navigationController presentModalViewController:infoNavController animated:YES];
    

	
}

-(IBAction)btnHelp_click
{
	Instructions *objSubView = [[Instructions alloc] initWithNibName:@"Instructions" bundle:[NSBundle mainBundle]];
    objSubView.isViewPushed = YES;
	[self.navigationController pushViewController:objSubView animated:YES];
	[objSubView release];
}
-(IBAction)btnPlay_click
{
	AnimationTestViewController *objSubView = [[AnimationTestViewController alloc] initWithNibName:@"AnimationTestViewController" bundle:[NSBundle mainBundle]];
	[self.navigationController pushViewController:objSubView animated:YES];
	[objSubView release];
}


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
	
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
	[toolbar removeFromSuperview];
}

- (void)dealloc {
	
	[toolbar dealloc];
    [super dealloc];
}


@end
