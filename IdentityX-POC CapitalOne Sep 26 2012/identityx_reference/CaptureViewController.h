//
//  CaptureViewController.h
//  identityx_reference
//
//  Created by Jonny Mortensen on 8/29/11.
//  Copyright 2011 Daon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IXAll.h"

// This is the base class for all screens that needs to capture and submit data.
// The class implements the IXTransactionDelegate.

@interface CaptureViewController : UIViewController <IXTransactionDelegate>
{

    UIBarButtonItem *doneButton;
    NSInteger stepIndex;
    
}

@property (nonatomic, retain) IXTransaction*  transaction;
@property (nonatomic, readwrite) NSInteger stepIndex;

- (id)initWithTitle:(NSString*)title transaction:(IXTransaction*)transaction;

- (void)showMessage:(NSString*)message;
- (void)setBusy:(BOOL)busy;

- (void)submit:(NSDictionary*)params;
- (void)back_barbutton_clicked;

- (IBAction)done;
- (IBAction)back;

@end
