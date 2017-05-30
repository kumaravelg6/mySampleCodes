// COPYRIGHT © 2010-2011 by Daon Holdings Limited. All rights reserved.
//
// This software is the confidential and proprietary property and information
// of Daon Holdings Limited.
//
// You shall not disclose such Confidential Information and shall use it
// only in accordance with the terms of the license agreement entered into
// with Daon.
//
// Products sold or licensed by Daon are covered by the terms of its
// contractual agreements, license agreements and the warranty and
// guarantees therein. Daon reserves the right to discontinue production
// and change specifications and processes at any time without notice.
//
// No part of this software may be reproduced in any form without the
// prior written consent of Daon.


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "IXTransactionDelegate.h"
#import "IXResponse.h"
#import "IXCommand.h"
#import "IXPolicy.h"

typedef enum
{
    IXActionUserID,
    IXActionPin,
    IXActionDuressPin,
    IXActionFace,
    IXActionFaceLiveness,
    IXActionPalm,
    IXActionVoice,
    IXActionCommit,
    IXActionDecline,
    IXActionDeclineFraud,
    IXActionLocation,
    IXActionSponsorshipCode,
    IXActionVerifyIdentity,
    IXActionUpdateProfile,
    IXActionVideo
    
} IXAction;


@interface IXTransaction : NSObject 

@property (nonatomic, retain) IXPolicy* policy;
@property (nonatomic, assign) IXAction action;
@property (nonatomic, assign) id<IXTransactionDelegate> delegate;

- (BOOL) isEnrollment;
- (BOOL) isVerifyIdentity;
- (BOOL) isUpdateProfile;
- (BOOL) canVerifyTransaction;

// Returns the list of actions required for this transaction. Each action must be submitted to
// the IdentityX service with the submit:delegate method
- (NSArray*)        requiredActions;

- (NSArray*)        utteranceList;
- (NSTimeInterval)  maxTimeForUtterance;

- (UIImage*)        serviceProviderIcon;
- (NSString*)       serviceProviderName;
- (NSString*)       transactionDescription;
- (NSString*)       transactionIdentifier;
- (NSString*)       serviceProviderIdentifier;
- (NSString*)       customerIdentifier;
- (NSDate*)         created;
- (NSDate*)         expires;

- (void) decline:(BOOL)fraud delegate:(id<IXTransactionDelegate>)transactionDelegate;
- (void) submit:(NSDictionary*)parms delegate:(id<IXTransactionDelegate>)transactionDelegate;
- (void) commit:(id)transactionDelegate;


// Clear all transaction data
- (void) clear;

- (NSArray*) commandListForAction:(IXAction)a;

@end
