//
//  identityx_referenceAppDelegate.h
//  identityx_reference
//
//  Created by Jonny Mortensen on 8/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class IXService;

@interface IdentityxReferenceAppDelegate : NSObject <UIApplicationDelegate> {

    NSInteger actionFlag; // 0 - Enrollment, 1 - Verification, 2 - Stepup 
    NSInteger stepup_actionFlag; // 0 - stepup Voice, 1 - Stepup Face, 2 - Stepup Palm, 3 - PIN
    NSInteger login_actionFlag; // 0 - stepup Voice, 1 - Stepup Face, 2 - Stepup Palm, 3 - PIN
    IXService *service;
}
@property (nonatomic, retain) IXService *service;
@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, readwrite) NSInteger actionFlag;
@property (nonatomic, readwrite) NSInteger stepup_actionFlag;
@property (nonatomic, readwrite) NSInteger login_actionFlag;

@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@end
