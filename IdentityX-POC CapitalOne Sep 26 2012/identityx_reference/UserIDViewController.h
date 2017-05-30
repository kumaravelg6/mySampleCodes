//
//  UserIDViewController.h
//  identityx_reference
//
//  Created by Jonny Mortensen on 8/29/11.
//  Copyright 2011 daon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IXAll.h"

#import "CaptureViewController.h"

// View controller for capturing the user id.

@interface UserIDViewController : CaptureViewController<UITextFieldDelegate>
{
    
    UITextField *userid;

}

@property (nonatomic, retain) IBOutlet UITextField *userid;

- (IBAction)editingChanged:(id)sender;

@end
