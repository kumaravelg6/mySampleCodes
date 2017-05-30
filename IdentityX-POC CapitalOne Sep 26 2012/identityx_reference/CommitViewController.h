//
//  CommitViewController.h
//  identityx_reference
//
//  Created by Jonny Mortensen on 8/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CaptureViewController.h"

#import "IdentityxReferenceAppDelegate.h"

@class ViewTransactions;

@interface CommitViewController : CaptureViewController 
{
    IdentityxReferenceAppDelegate *appDelegate;
    IBOutlet UILabel *Lbl_description;
}

@property (nonatomic, retain) IBOutlet UILabel *Lbl_description;

@end
