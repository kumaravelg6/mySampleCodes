//
//  IXDevice.h
//  identityx_api
//
//  Created by Neil/Jonny on 4/18/12.
//  Copyright (c) 2012 Daon. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum
{
	IXDeviceStatusActive	= 0,
	IXDeviceStatusBlocked	= 1
} IXDeviceStatus;

typedef enum
{
	IXNewDeviceCodeResponseCodeNotFound = 0,
	IXNewDeviceCodeResponseCodeExpired	= 1,
	IXNewDeviceCodeResponseCodeInvalid	= 2,
	IXNewDeviceCodeResponseCodeAccepted	= 3
} IXNewDeviceCodeResponse;

@interface IXDevice : NSObject
{	
}

@property (nonatomic, readonly) NSString *uniqueId;
@property (nonatomic, readonly) NSString *description;
@property (nonatomic) IXDeviceStatus status;
@property (nonatomic, readonly) NSDate *enrolledDate;
@property (nonatomic, readonly) NSDate *lastTransactionDate;

// Initialisation

// TODO Make private. Data will come form server

- (id) initWithId:(NSString*)deviceId 
  withDescription:(NSString*)deviceDescription 
	   withStatus:(IXDeviceStatus)deviceStatus 
	 enrolledDate:(NSDate*)enrolled 
lastTransactionDate:(NSDate*)lastTransaction;

@end
