//
//  Instructions.m
//  AnimationTest
//
//  Created by Galaxy Weblinks on 12/08/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Instructions.h"


@implementation Instructions

@synthesize isViewPushed;




// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];

}

-(void) viewWillAppear:(BOOL)animated {
	
	[super viewWillAppear:animated];
    if(isViewPushed == NO) {
        
    self.navigationController.navigationItem.backBarButtonItem = nil;

    self.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc] 
                                              initWithBarButtonSystemItem:UIBarButtonSystemItemCancel 
                                              target:self action:@selector(cancel_Clicked:)] autorelease];
    }
}



-(void) cancel_Clicked:(id)sender {
	

    if(isViewPushed == NO) {
        [self.navigationController dismissModalViewControllerAnimated:YES];
    }
    else
    [self.navigationController popViewControllerAnimated:YES];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
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


- (void)dealloc {
    [super dealloc];
}


@end
