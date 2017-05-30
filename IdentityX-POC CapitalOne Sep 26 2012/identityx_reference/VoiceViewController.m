//
//  VoiceViewController.m
//  identityx_reference
//
//  Created by Jonny Mortensen on 8/31/11.
//  Copyright 2011 Daon. All rights reserved.
//

#import "VoiceViewController.h"


@implementation VoiceViewController

@synthesize utterance;
@synthesize progress;
@synthesize recordButton;



- (void)dealloc
{
    [audio release];
    [utterance release];
    [recordButton release];
    
    [progress release];
    [super dealloc];
}


#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
   
    audio = [[IXAudio alloc] init];
    samples = [[NSMutableArray alloc] init];
    ;	
    [recordButton setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    
       
}

- (void)viewDidUnload
{
    [self setUtterance:nil];
    [self setRecordButton:nil];
    
    [audio release];
    [samples release];
    
    [self setProgress:nil];
    [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated
{
       
    self.navigationItem.rightBarButtonItem = nil;
   
    
    [self updateUtterance];

}


- (void)updateUtterance
{
    // The transactions contains a list of utterances that needs
    // to be captured. For enrollment it may be 3 and for verification it
    // could be 1 or 2 in case voice liveness is required.
    
    NSArray* utterances = [self.transaction utteranceList];
    
    if (index < [utterances count])
    {
        progress.text = [NSString stringWithFormat:@"%d of %d", index + 1, [utterances count]];
        utterance.text = [utterances objectAtIndex:index++];
    }
    else
    {
        //progress.text = @"Voice capture completed.select Done to complete the process";
        //utterance.text = @"";
        
        
        NSDictionary* params = [NSDictionary dictionaryWithObject:samples 
                                                           forKey:[NSNumber numberWithInt:IXActionVoice]];
        
        // Submit the data
        [self submit:params];
    }
}

- (IBAction)record:(id)sender 
{
    // The user pressed the record button.
    
    if ([audio isRecording])
    {
        // Stop recording
        [audio stopRecording];
        
        // Get the recorded data and add it to the list of samples
        NSData* data = [audio data];
        if (data != nil)
        {
            NSLog(@"*** Adding voice data: %d", [data length]);
            [samples addObject:data];
        }
        
        // If all the samples have been recorded, enable the Done button and
        // hide the record button.
        
        if ([samples count] == [[self.transaction utteranceList] count])
        {
            //doneButton.enabled = YES;
            recordButton.enabled = NO;            
        }

        [self updateUtterance];
        
        // Change button title for next sample 
        [recordButton setTitle:@"Start Recording" forState:UIControlStateNormal];	
        [recordButton setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    }
    else
    {
        // Start recording
        [audio startRecording];
        
        [recordButton setTitle:@"Stop Recording" forState:UIControlStateNormal];
        [recordButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        
    }
    
    
}



- (IBAction)done 
{
    // IdentityX: Submit Voice Samples
    //
    // Submit the captured voice samples to the service. The submit method takes a key-value 
    // dictionary and an event listener.  The key is the action and the value the data, 
    // e.g. a string, a byte array etc.
    //
    
    NSDictionary* params = [NSDictionary dictionaryWithObject:samples 
                                                       forKey:[NSNumber numberWithInt:IXActionVoice]];
     NSLog(@"+++++++++ submit starts for Voice: +++++++++");
    // Submit the data
    [self submit:params];
}

- (IBAction)back
{
    [self back_barbutton_clicked];
}

@end
