//
//  PalmViewController.h
//  identityx_reference
//
//  Created by Jonny Mortensen on 8/30/11.
//  Copyright 2011 Daon. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CaptureViewController.h"

@interface PalmViewController : CaptureViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>
{
    UIImage* image;
    UIImageView *picture;
}

@property (nonatomic, retain) IBOutlet UIImageView *picture;

- (IBAction)takePicture:(id)sender;

@end
