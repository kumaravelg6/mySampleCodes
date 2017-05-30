//
//  PINCaptureViewController.h
//  identityx_template
//
//  Created by Jonny Mortensen on 8/25/11.
//  Copyright 2011 Daon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IXAll.h"

#import "CaptureViewController.h"

// View controller for capturing PIN and Duress PIN

@interface PinViewController : CaptureViewController <UITextFieldDelegate>
{
    UITextField *pin;       // PIN field
    UITextField *confirm;   // Confirm PIN field
    UILabel *lbl_pin;       // PIN Label
    UILabel *lbl_confirm;   // Confirm Label
    UILabel *lbl_duress_desc; // Duress description Label

    BOOL duress;            // True if this is a duress PIN
}

@property (nonatomic, retain) IBOutlet UITextField *pin;
@property (nonatomic, retain) IBOutlet UITextField *confirm;
@property (nonatomic, retain) IBOutlet UILabel *lbl_confirm, *lbl_pin, *lbl_duress_desc;



- (id)initWithTitle:(NSString*)title transaction:(IXTransaction*)transaction duress:(BOOL)isDuressPin;

- (IBAction)editChanged:(id)sender;

- (void) checkPin;

@end
