//
//  PINCaptureViewController.m
//  identityx_template
//
//  Created by Jonny Mortensen on 8/25/11.
//  Copyright 2011 Daon. All rights reserved.
//

#import "PinViewController.h"


@implementation PinViewController

@synthesize pin;
@synthesize confirm;
@synthesize lbl_confirm, lbl_pin, lbl_duress_desc;

- (id)initWithTitle:(NSString*)title transaction:(IXTransaction*)transaction duress:(BOOL)isDuressPin
{
    self = [super initWithTitle:title transaction:transaction];
    if (self)
    {
        duress = isDuressPin;
    }
    return self;
    
}

- (void)dealloc
{
    [pin release];
    [confirm release];
 
    [super dealloc];
}


#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [self setPin:nil];
    [self setConfirm:nil];

    [super viewDidUnload];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    // If enrolling show the confirmation field, otherwise we are verifying, so just show the
    // PIN input field
       
    if (![self.transaction isEnrollment])
    {
        confirm.hidden = YES;   
        lbl_confirm.hidden = YES;
    }
    lbl_duress_desc.hidden = YES;
    if(duress)
    {
        lbl_pin.text = @"Enter 4-10 digit DuressPin.";
        lbl_confirm.text = @"Please confirm DuressPin.";
        lbl_duress_desc.text = @"Enter your DuressPin which will be used to notify emergency";
        lbl_duress_desc.hidden = NO;
    }
    
    [self checkPin];
}

- (void) checkPin
{
    // Make sure we have a PIN. The framework will check the validity.
    
    if ([pin.text length] >= 4 && (confirm.hidden || [pin.text isEqualToString:confirm.text]))
        doneButton.enabled = YES;
    else
        doneButton.enabled = NO;
}

- (IBAction) editChanged:(id)sender
{
    // Called whenever the text in the PIN or confirm PIN field is changed.
    
    [self checkPin];
}


- (IBAction)done
{  
    // The user pressed the Done button, so submit the PIN.
    doneButton.enabled = NO;
    
    NSNumber* key = [NSNumber numberWithInt:duress ? IXActionDuressPin : IXActionPin];
    
    NSDictionary* params = [NSDictionary dictionaryWithObject:pin.text forKey:key];
    
    NSLog(@"+++++++++ submit starts for PIN: +++++++++");
    // Submit the data
    [self submit:params];
}

- (IBAction)back
{
    [self back_barbutton_clicked];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	[pin resignFirstResponder];
	[confirm resignFirstResponder];
}


@end
