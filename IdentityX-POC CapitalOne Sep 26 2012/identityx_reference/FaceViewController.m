//
//  FaceViewController.m
//  identityx_reference
//
//  Created by Jonny Mortensen on 8/30/11.
//  Copyright 2011 Daon. All rights reserved.
//

#import "FaceViewController.h"


@implementation FaceViewController

@synthesize picture;
@synthesize imagePicker;


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
}

-(void)viewWillAppear:(BOOL)animated
{
    if (image != nil)
    {
        doneButton.enabled = YES;
    }
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
    [imagePicker release];
    [picker dismissModalViewControllerAnimated:YES];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [imagePicker release];
    [self dismissModalViewControllerAnimated:YES];
}

#pragma mark

// Called when the user presses the Take Picture button.

- (IBAction)takePicture:(id)sender 
{
      
    imagePicker = [[UIImagePickerController alloc] init];
	
	imagePicker.delegate = self;
	imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    imagePicker.showsCameraControls = YES;
	imagePicker.allowsEditing = NO;
	imagePicker.toolbarHidden = YES;
	imagePicker.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
	imagePicker.wantsFullScreenLayout = YES;
    
    CGAffineTransform translate = CGAffineTransformMakeTranslation(0.0, 27.0);
    imagePicker.cameraViewTransform = translate;
    CGAffineTransform scale = CGAffineTransformScale(translate, 1.25, 1.25);
    imagePicker.cameraViewTransform = scale;
    
    //imagePicker.cameraViewTransform = CGAffineTransformMakeScale(1.3, 1.3);
    
    //CGAffineTransform translate = CGAffineTransformMakeTranslation(0, 0);
    
    //imagePicker.cameraViewTransform = CGAffineTransformScale(translate, 1.12412,1.12412);
    
    //imagePicker.cameraViewTransform = CGAffineTransformMakeScale(1.26, 1.26);  
 
	if ([UIImagePickerController respondsToSelector:@selector(isCameraDeviceAvailable:)])
	{
		if ([UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceFront])
		{
            [imagePicker setCameraDevice:UIImagePickerControllerCameraDeviceFront];

		}
	}
    
    // Show the camera UI and View Finder.
    
    [self presentModalViewController:imagePicker animated:YES];
    
}

- (IBAction)done 
{
    // IdentityX: Submit face image 
    //
    // Submit the captured image to the service. The submit method takes a key-value 
    // dictionary and an event listener.  The key is the action and the value the data, 
    // e.g. a string, a byte array etc.
    //
    doneButton.enabled = NO;
    
    NSDictionary* params = [NSDictionary dictionaryWithObject:image forKey:[NSNumber numberWithInt:IXActionFace]];
    
    
    NSLog(@"+++++++++ submit starts for Face: +++++++++");
    // Submit the data
    [self submit:params];
}
- (IBAction)back
{
    [self back_barbutton_clicked];
}



@end
