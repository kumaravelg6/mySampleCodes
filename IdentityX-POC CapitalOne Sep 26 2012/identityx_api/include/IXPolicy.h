//
//  IXPolicy.h
//  identityx_api
//
//  Created by Jonny Mortensen on 5/4/11.
//  Copyright 2011 Daon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface IXPolicy : NSObject 

- (id) initWithDictionary:(NSDictionary*)dict;

+ (IXPolicy*) policyUpdateProfileWithName:(NSString*)name;
+ (IXPolicy*) policyVerifyIdentityWithName:(NSString*)name;

- (BOOL) isVideo; // Genesis
- (BOOL) isStandard;

- (BOOL) isFaceRequired;
- (BOOL) isFaceLivenessRequired;
- (BOOL) isPalmRequired;
- (BOOL) isVoiceRequired;
- (BOOL) isVoiceLivenessRequired;
- (BOOL) isPINRequired;
- (BOOL) isDuressPINRequired;
- (BOOL) isGPSCoordinatesRequired;
- (BOOL) isSponsorshipRequest;
- (BOOL) isVerifyIdentity;
- (BOOL) isUpdateProfile;

- (void) requirePIN;
- (void) requireDuressPin;
- (void) requireFace;
- (void) requirePalm;
- (void) requireVoice;
- (void) requireLocation;

- (void) setTransactionDescription:(NSString*)description;
- (void) setServiceProviderName:(NSString*)name;
- (void) setTransactionIdentifier:(NSString*)transactionid;

- (NSString*) policyIdentifier;
- (NSString*) policyDescription;

- (NSString*) textDependentUtterance;
- (NSString*) textIndependentUtterance;
- (UIImage*) serviceProviderIcon;
- (NSString*) serviceProviderName;
- (NSString*) transactionDescription;
- (NSString*) serviceProviderTransactionIdentifier;
- (NSString*) serviceProviderIdentifier;
- (NSString*) customerIdentifier;
- (NSString*) livenessInstructions;

- (NSDate*) created;
- (NSDate*) expires;

- (void) writeToLog;

@end
