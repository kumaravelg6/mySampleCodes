//
//  VoiceViewController.h
//  identityx_reference
//
//  Created by Jonny Mortensen on 8/31/11.
//  Copyright 2011 Daon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IXAudio.h"

#import "CaptureViewController.h"

@interface VoiceViewController : CaptureViewController 
{
    IXAudio *audio;         // Audio recording
        
    UILabel *utterance;     // The current utterance
    UILabel *progress;      // Which utterance and how may left
    UIButton *recordButton; // Toogles recording
    
    NSMutableArray* samples;// Stored recorded voice samples

    int index;
   
}

@property (nonatomic, retain) IBOutlet UILabel *utterance;
@property (nonatomic, retain) IBOutlet UILabel *progress;
@property (nonatomic, retain) IBOutlet UIButton *recordButton;

- (IBAction)record:(id)sender;

- (void)updateUtterance;

@end
