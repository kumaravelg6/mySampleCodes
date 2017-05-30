//
//  Request.h
//  identityx_api
//
//  Created by Jonny Mortensen on 5/3/11.
//  Copyright 2011 Daon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IXParser.h"


@interface IXRequest : NSMutableURLRequest
{
@private
    NSUInteger      _metadata;
    id<IXParser>    _parser;
    NSString*       _name;
}

@property (nonatomic, assign) NSUInteger   metadata; //NSDictionary* metadata;
@property (nonatomic, retain) id<IXParser> parser;
@property (nonatomic, retain) NSString*    name;


- (id) initWithURL:(NSURL*)url parser:(id<IXParser>)parser;

- (void) setHTTPHeader:(NSDictionary*)header;
- (void) setHTTPHeaderField:(NSString*)field value:(NSString*)value;

@end