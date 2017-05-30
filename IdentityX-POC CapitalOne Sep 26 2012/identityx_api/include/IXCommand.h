//
//  IXCommand.h
//  identityx_api
//
//  Created by Jonny Mortensen on 2/2/12.
//  Copyright (c) 2012 Daon. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum
{
    IXCommandPause, 
    IXCommandSay, 
    IXCommandQuery, 
    IXCommandRepeat,
    IXCommandDisplay,
    IXCommandPlay
    
} IXCommandType;

@interface IXCommand : NSObject

@property (nonatomic, readonly) IXCommandType   type; 
@property (nonatomic, readonly, retain) NSObject* data;         // Different content based on the type, i.e NSNumber for IXCommandTypePause
@property (nonatomic, readonly) NSInteger allowance;            // Time available for user to perform command, 
                                                                // 0 = No time limit, >0 = Show countdown bar <0 = Don't show countdown bar
@property(nonatomic, readonly, getter = isSkippable) BOOL skip;


- (id) initWithString:(NSString*)str;
- (void) parse:(NSString*)str;

@end
