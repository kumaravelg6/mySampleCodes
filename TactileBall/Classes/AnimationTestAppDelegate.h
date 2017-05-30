//
//  AnimationTestAppDelegate.h
//  AnimationTest
//
//  Created by Galaxy Weblinks on 12/08/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface AnimationTestAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;

	UINavigationController  *homeScreen; 
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet UINavigationController *homeScreen;

@end

