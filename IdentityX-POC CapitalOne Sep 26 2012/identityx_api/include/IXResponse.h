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

static const int IXErrorUserExists      = 101;
static const int IXErrorUserIDFormat    = 102;
static const int IXErrorPINInvalid      = 103;
static const int IXErrorPINFormat       = 104;
static const int IXErrorVoice           = 105;
static const int IXErrorPalm            = 106;
static const int IXErrorFace            = 107;
static const int IXErrorFaceLiveness    = 108;
static const int IXErrorLocation        = 109;
static const int IXErrorImageVerify     = 110;
static const int IXErrorVoiceVerify     = 111;
static const int IXErrorOTPKeys         = 112;
static const int IXErrorCertificate     = 113;
static const int IXErrorUnableToConnect = 114;
static const int IXErrorInvalidRequest  = 115;
static const int IXErrorCommit          = 116;
static const int IXErrorSponsor         = 117;
static const int IXErrorVerifyIdentity  = 118;
static const int IXErrorCancel          = 119;
static const int IXErrorVideo           = 120;

@interface IXResponse : NSObject 

- (id) initWithDictionary:(NSDictionary*)dict;
                          
- (NSInteger) code;
- (NSString*) message;

- (BOOL) isValid;
- (BOOL) isBound;

- (BOOL) isVerified;

- (BOOL) isValidImage;
- (BOOL) isValidVoiceSample;
- (BOOL) isValidSponsorCode;
- (BOOL) isValidUserID;

- (BOOL) isOneTimePassword;
- (BOOL) isVirtualCard;

- (NSString*) oneTimePassword;
- (NSString*) virtualCardNumber;
- (NSString*) virtualCardExpirationDate;
- (NSString*) virtualCardVerificationValue;

- (NSString*) certificate;
- (NSString*) secret;

- (NSString*) p12;

- (NSArray*) items;

// Devices
- (NSString*) deviceId;
- (NSString*) deviceDescription;
- (NSDate*) deviceEnrollmentDate;
- (NSDate*) deviceLastTransactionDate;
- (int) deviceStatus;


@end
