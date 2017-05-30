//
//  FaceViewController.h
//  identityx_reference
//
//  Created by Jonny Mortensen on 8/30/11.
//  Copyright 2011 Daon. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CaptureViewController.h"

// Capture face image

@interface FaceViewController : CaptureViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>
{
    UIImage* image;
    UIImageView *picture;
    UIImagePickerController* imagePicker;
}

@property (nonatomic, retain) IBOutlet UIImageView *picture;

@property (nonatomic, retain) UIImagePickerController* imagePicker;

- (IBAction)takePicture:(id)sender;

@end
