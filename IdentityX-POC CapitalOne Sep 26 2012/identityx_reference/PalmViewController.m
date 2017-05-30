//
//  PalmViewController.m
//  identityx_reference
//
//  Created by Jonny Mortensen on 8/30/11.
//  Copyright 2011 Daon. All rights reserved.
//

#import "PalmViewController.h"


@implementation PalmViewController
@synthesize picture;


- (void)dealloc
{
    [picture release];
    [super dealloc];
}


#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)viewDidUnload
{
    [self setPicture:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}
 


#pragma mark UIImagePickerController Delegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    image = [info objectForKey: UIImagePickerControllerOriginalImage];
    
    if (image != nil)
    {
        doneButton.enabled = YES;
        picture.image = image;
    }
    
    [picker dismissModalViewControllerAnimated:YES];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissModalViewControllerAnimated:YES];
}

#pragma mark

// Called when the user presses the Take Picture button.

- (IBAction)takePicture:(id)sender 
{
    UIImagePickerController* imagePicker = [[UIImagePickerController alloc] init];
	
	imagePicker.delegate = self;
	imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
	imagePicker.showsCameraControls = YES;
	imagePicker.allowsEditing = NO;
	imagePicker.toolbarHidden = YES;
	imagePicker.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
	
    imagePicker.cameraViewTransform = CGAffineTransformMakeScale(1.26, 1.26);    
    
	if ([UIImagePickerController respondsToSelector:@selector(isCameraDeviceAvailable:)])
	{
		if ([UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceFront])
		{
			imagePicker.cameraDevice = UIImagePickerControllerCameraDeviceFront;									
		}
	}
    
    // Show the camera UI and View Finder.
    
    [self presentModalViewController:imagePicker animated:YES];
}

- (IBAction)done 
{
    // IdentityX: Submit palm image 
    //
    // Submit the captured palm image to the service. The submit method takes a key-value 
    // dictionary and an event listener.  The key is the action and the value the data, 
    // e.g. a string, a byte array etc.
    //
    
    
    NSDictionary* params = [NSDictionary dictionaryWithObject:image forKey:[NSNumber numberWithInt:IXActionPalm]];
    
    NSLog(@"+++++++++ submit starts for PALM: +++++++++");
    // Submit the data
    [self submit:params];
}
- (IBAction)back
{
    [self back_barbutton_clicked];
}

@end
