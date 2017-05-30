//
//  ViewManager.h
//  identityx_reference
//
//  Created by Jonny Mortensen on 8/25/11.
//  Copyright 2011 Daon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CaptureViewController.h"

@interface CaptureViewFactory : NSObject 

// This class handles the flow of the data capture screens (view controllers).

+ (CaptureViewController*)initalViewControllerForTransaction:(IXTransaction*)transaction;
+ (CaptureViewController*)viewControllerForTransaction:(IXTransaction*)transaction followingAction:(IXAction)action;

+ (NSArray*)requiredActions:(IXTransaction*)transaction;

@end
