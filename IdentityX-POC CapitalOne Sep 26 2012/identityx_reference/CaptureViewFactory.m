//
//  ViewManager.m
//  identityx_reference
//
//  Created by Jonny Mortensen on 8/25/11.
//  Copyright 2011 Daon. All rights reserved.
//

#import "CaptureViewFactory.h"

#import "CaptureViewController.h"

#import "UserIDViewController.h"
#import "PinViewController.h"
#import "CommitViewController.h"
#import "FaceViewController.h"
#import "PalmViewController.h"
#import "VoiceViewController.h"


// A transaction has a policy, specifying the required information that is neccesary to complete a
// verification. 
//
// - (NSArray*)requiredActions 
//
// returns a list of data items that needs to be captured. E.g. a simple transactions could contain
// the following actions: IXActionPin, IXActionVoice
//
// To capture all the necessary data, an application will have to go through the list, capture and
// submit the data.
//
// In this example, the current view controller will pass the current action (e.g. IXActionPIN) and
// return the next action. If none is found, we assume that everything has been captured and commit
// the transaction.


@implementation CaptureViewFactory

/*
+ (NSArray*)requiredActions:(IXTransaction*)transaction
{    
    return [transaction requiredActions];
}*/


+ (NSArray*)requiredActions:(IXTransaction*)transaction
{    
    NSArray *actions = [transaction requiredActions];
    
    // HACK: Create a new array without user id
    NSMutableArray *nactions = [NSMutableArray array];
    for (NSNumber *action in actions)
    {
        if ([action intValue] != IXActionUserID)
            [nactions addObject:action];
    }
    
    return nactions;
}

// Return the view controller for capturing the action at a given index. This is a helper method for the 
// next two methods

+ (CaptureViewController*)viewControllerForIndex:(NSUInteger)index transaction:(IXTransaction*)transaction
{
    CaptureViewController* controller = nil;
    
    // Get the list of required data items
    NSArray* actions = [CaptureViewFactory requiredActions:transaction];
    
    
    if (index >= [actions count])
    {
        controller = [[CommitViewController alloc] initWithTitle:@"Verify" transaction:transaction];
        controller.stepIndex = index+1;
    }
    else
    {
        IXAction action = [[actions objectAtIndex:index] intValue];
        switch (action) 
        {
            
            case IXActionUserID:
            {
                NSString *stepStr = [NSString stringWithFormat:@"UserID - step %d/%d",index+1,[actions count]];
                controller = [[UserIDViewController alloc] initWithTitle:stepStr transaction:transaction];
                controller.stepIndex = index+1;
                break;
            }    
            case IXActionPin:
            {
                NSString *stepStr = [NSString stringWithFormat:@"PIN - step %d/%d",index+1,[actions count]];
                controller = [[PinViewController alloc] initWithTitle:stepStr transaction:transaction duress:NO];
                controller.stepIndex = index+1;
                break;
            }   
            case IXActionDuressPin:
            {
                NSString *stepStr = [NSString stringWithFormat:@"DuressPIN - step %d/%d",index+1,[actions count]];
                controller = [[PinViewController alloc] initWithTitle:stepStr transaction:transaction duress:YES];
                break;
            }
            case IXActionFace:
            {
                NSString *stepStr = [NSString stringWithFormat:@"Face - step %d/%d",index+1,[actions count]];
                controller = [[FaceViewController alloc] initWithTitle:stepStr transaction:transaction];
                controller.stepIndex = index+1;
                break;
            }   
            case IXActionPalm:
            {
                NSString *stepStr = [NSString stringWithFormat:@"Palm - step %d/%d",index+1,[actions count]];
                controller = [[PalmViewController alloc] initWithTitle:stepStr transaction:transaction];
                controller.stepIndex = index+1;
                break;
            }
            case IXActionVoice:
            {
                NSString *stepStr = [NSString stringWithFormat:@"Voice - step %d/%d",index+1,[actions count]];
                controller = [[VoiceViewController alloc] initWithTitle:stepStr transaction:transaction];
                controller.stepIndex = index+1;
                break;
            }   
            default:
                break;
        }
    }
    
    
    return controller;
}

// Get the first view controller. This method is called when the user selects a transaction

+ (CaptureViewController*)initalViewControllerForTransaction:(IXTransaction*)transaction
{
    return [self viewControllerForIndex:0 transaction:transaction];
}

// Get the view controller following a given action. This method is called from every data capture screen whenever
// the data was succesfully submitted to the IdentityX service.

+ (CaptureViewController*)viewControllerForTransaction:(IXTransaction*)transaction followingAction:(IXAction)action;
{
    NSUInteger i = 0;
    
    NSArray* actions = [CaptureViewFactory requiredActions:transaction];
    
    while (i < [actions count]) 
    {
        IXAction a = [[actions objectAtIndex:i++] intValue];
        if (a == action)
            break;
    }

      
    return [self viewControllerForIndex:i transaction:transaction];
}



@end
