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
#import <CoreLocation/CoreLocation.h>

#import "IXTransaction.h"
#import "IXServiceDelegate.h"
#import "IXDeviceDelegate.h"
#import "IXPolicy.h"

@interface IXService : NSObject 

@property (nonatomic, getter = isEnrolled) BOOL enrolled;
@property (nonatomic, getter = isInitialized) BOOL initialized;

- (void) initialize:(NSString*)userid
            authURL:(NSString*)authenticationServiceURL
            dataURL:(NSString*)identityXServiceURL
           delegate:(id<IXServiceDelegate>)serviceDelegate;

- (void) initialize:(NSString*)userid
            authURL:(NSString*)authenticationServiceURL
            dataURL:(NSString*)identityXServiceURL
   trustCertificate:(BOOL)trust
           delegate:(id<IXServiceDelegate>)serviceDelegate;

- (void) initialize:(NSString*)userid
            authURL:(NSString*)authenticationServiceURL
            dataURL:(NSString*)identityXServiceURL
   trustCertificate:(BOOL)trust
        sponsorship:(BOOL)enableSponsorship
           delegate:(id<IXServiceDelegate>)serviceDelegate;

- (void) initialize:(NSString*)userid
            authURL:(NSString*)authenticationServiceURL
            dataURL:(NSString*)identityXServiceURL
   trustCertificate:(BOOL)trust
        sponsorship:(BOOL)enableSponsorship
        checkStatus:(BOOL)checkDeviceStatus
           delegate:(id<IXServiceDelegate>)serviceDelegate;

// Framework/API version
+ (NSString*) version;

+ (NSString*) deviceID DEPRECATED_ATTRIBUTE;
- (NSString*) uniqueID;

+ (CLLocation*) location;

- (NSString*) oneTimePasswordWithPin:(NSString*)pin;
- (NSString*) oneTimePassword;

- (void) refreshOneTimePasswordKeys;

- (void) refreshTransactionList;
- (void) requestTransactionWithId:(NSString*)transactionId provider:(NSString*)providerName;

- (void) cancel;

- (void) removeCertificate;
- (void) removeCertificateForUrl:(NSURL*)url;

// Create an empty transaction for this user id/profile id. 

//- (IXTransaction*) transactionWithId:(NSString *)tid provider:(NSString*)provider policy:(NSString*)policy description:(NSString*)description DEPRECATED_ATTRIBUTE;
- (IXTransaction*) transactionWithPolicy:(IXPolicy*)policy provider:(NSString*)providerName description:(NSString*)description;

- (void) addTransaction:(IXTransaction*)transaction;

// Device Management

- (void) listDevices:(id<IXDeviceDelegate>)delegate;
- (void) newDeviceCode;
- (void) addDeviceWithCode:(NSString*)ndc;

@end
