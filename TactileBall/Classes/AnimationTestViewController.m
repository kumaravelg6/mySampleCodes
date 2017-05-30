//
//  AnimationTestViewController.m
//  AnimationTest
//
//  Created by Galaxy Weblinks on 12/08/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "AnimationTestViewController.h"

@implementation AnimationTestViewController

@synthesize timer;
@synthesize lblmissed, lblpoints, lbllevel;
@synthesize isViewPushed;
@synthesize btnpaused;

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

- (void)viewWillAppear:(BOOL)animated {
	
    [super viewWillAppear:YES];
	
	[self.navigationController setToolbarHidden:NO animated:YES];

    [self.navigationController.view addSubview:lblmissed];
	[self.navigationController.view addSubview:lblpoints];
	[self.navigationController.view addSubview:lbllevel];
	
} 

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	
	x = 50;
	y = 50;
	tagVal=0;
	missed =0;
	points=0;
	intervalval=1.5;
	level =1;
	currentLevel =1;
	pauseStatus = FALSE;
	btnpaused.hidden = TRUE;
	
	[self.view bringSubviewToFront:btnpaused];
	
	if(isViewPushed == NO) {
		
		self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] 
												  initWithBarButtonSystemItem:UIBarButtonSystemItemPause
												  target:self action:@selector(pause_Clicked)] autorelease];
	}
	
	timer =[NSTimer scheduledTimerWithTimeInterval:intervalval target:self selector:@selector(funAnimate) userInfo:nil repeats:YES]; 
	
	//[self wiggle];
}

-(void)change_level:(NSInteger)timerInterval:(NSInteger)thislevel
{
	if (currentLevel != level) {
		timer =[NSTimer scheduledTimerWithTimeInterval:timerInterval target:self selector:@selector(funAnimate) userInfo:nil repeats:YES]; 
	}
	currentLevel = thislevel;
	intervalval = timerInterval;
}

-(void) pause_Clicked
{
		
	self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] 
											   initWithBarButtonSystemItem:UIBarButtonSystemItemPlay
											   target:self action:@selector(play_Clicked)] autorelease];
	[timer invalidate];
	timer = nil;
	[self.navigationController.view addSubview:btnpaused];
	btnpaused.hidden = FALSE;
	pauseStatus = TRUE;
	
}

-(void) play_Clicked
{
	
	btnpaused.hidden = TRUE;
	
	
	
	timer =[NSTimer scheduledTimerWithTimeInterval:intervalval target:self selector:@selector(funAnimate) userInfo:nil repeats:YES];
	self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] 
											   initWithBarButtonSystemItem:UIBarButtonSystemItemPause
											   target:self action:@selector(pause_Clicked)] autorelease];
	pauseStatus=FALSE;
}



-(void)funAnimate
{
	
	if (pauseStatus == FALSE) 
	{
			
	tagVal=tagVal+1;

	CGRect rect;
	rect.size.height = 48;
	rect.size.width = 48;
	rect.origin.x = 1+random() % 300;
	rect.origin.y = 1+random() % 360;
	
	UIButton *imgbtn= [UIButton alloc];
	UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"red-icon.png"]];
	imgbtn.backgroundColor =background;
	[imgbtn setTag:tagVal];
	[imgbtn addTarget:self action:@selector(button_touched:) forControlEvents:UIControlEventTouchUpInside];
			
	[imgbtn initWithFrame:rect];
	[self.view addSubview:imgbtn];
	//imgbtn.frame = rect;
	[imgbtn release];
	missed=missed+1;
	
		
	if (points>=10 && points<20) 
	{
		level = 2;
		[self change_level:1.0 :level];
	}
	else if(points>=20 && points<30)
	{
		level = 3;
		[self change_level:0.75 :level];
	}
	else if(points>=30 && points<40)
	{
		level = 4;
		[self change_level:0.50 :level];
	}
	else if(points>=40 && points<50)
	{
		level = 5;
		[self change_level:0.25 :level];
	}
	else if(points>=50 && points<100)
	{
		level = 6;
		[self change_level:0.12 :level];
	}
	else if(points>=100) 
	{
		CGRect rect1;
		rect1.size.height = 380;
		rect1.size.width = 320;
		rect1.origin.x =  0;
		rect1.origin.y = 0;
		UILabel *lblgameover =[UILabel alloc];
		lblgameover.text =@"Congrats ! You Won the Game !!!";
		lblgameover.backgroundColor =[UIColor blueColor];
		lblgameover.textAlignment = UITextAlignmentCenter;
		[lblgameover initWithFrame:rect1];
		[self.view addSubview:lblgameover];
		[lblgameover release];
		[timer invalidate];
		
	}
	
	lblmissed.text =[NSString stringWithFormat:@"Missed : %i",missed];
	lblpoints.text =[NSString stringWithFormat:@"Points : %i",points]; 
	lbllevel.text =[NSString stringWithFormat:@"Level : %i",level];
	
	
	if (missed >= 10) {
		
		CGRect rect1;
		rect1.size.height = 380;
		rect1.size.width = 320;
		rect1.origin.x =  0;
		rect1.origin.y = 0;
		UILabel *lblgameover =[UILabel alloc];
		lblgameover.text =@"Game Over !!!";
		lblgameover.backgroundColor =[UIColor blueColor];
		lblgameover.textAlignment = UITextAlignmentCenter;
		[lblgameover initWithFrame:rect1];
		[self.view addSubview:lblgameover];
		[lblgameover release];
		
		timer =[NSTimer scheduledTimerWithTimeInterval:0 target:self selector:nil userInfo:nil repeats:NO]; 
		[timer invalidate];
		timer = nil;
        self.navigationItem.rightBarButtonItem = nil;
		pauseStatus=TRUE;
	}
	

  }
	
}

- (IBAction)button_touched:(id)sender
{
	NSLog(@"tag = %d",[sender tag]);
	UIButton *button = (UIButton *)sender;  
    //int pressed = button.tag;  
    [button removeFromSuperview]; 
	missed=missed-1;
	points = points+1;
	
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

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
	btnpaused.hidden = YES; // To hide the paused button
	[lbllevel removeFromSuperview];
	[lblpoints removeFromSuperview];
	[lblmissed removeFromSuperview];
}

- (void)dealloc {
    [super dealloc];
}

@end
