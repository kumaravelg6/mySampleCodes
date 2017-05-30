//
//  UserIDViewController.m
//  identityx_reference
//
//  Created by Jonny Mortensen on 8/29/11.
//  Copyright 2011 Daon. All rights reserved.
//

#import "UserIDViewController.h"
#import "CaptureViewFactory.h"

@implementation UserIDViewController

@synthesize userid;


- (void)dealloc
{
    [userid release];
    [super dealloc];
}


#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    //userid.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"user.id"];

}

- (void)viewDidUnload
{
    [self setUserid:nil];
    [super viewDidUnload];
}



- (IBAction)editingChanged:(id)sender 
{
    doneButton.enabled = [userid.text length] > 0;
}

- (IBAction)done 
{
    // IdentityX: Submit User ID 
    //
    // Submit the captured data to the service. The submit method takes a key-value 
    // dictionary and an event listener.  The key is the action and the value the data, 
    // e.g. a string, a byte array etc.
    //
    doneButton.enabled = NO;
    // Store user id
    [[NSUserDefaults standardUserDefaults] setObject:userid.text forKey:@"user.id"];
    
    NSDictionary* params = [NSDictionary dictionaryWithObject:userid.text 
                                                       forKey:[NSNumber numberWithInt:IXActionUserID]];
    
    // Submit the data
    [self submit:params];
}
- (IBAction)back
{
    [self back_barbutton_clicked];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
	if (textField == userid) {
		[userid resignFirstResponder];
	}
	return YES;
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	[userid resignFirstResponder];
}


@end
