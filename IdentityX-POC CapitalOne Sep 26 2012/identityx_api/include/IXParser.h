//
//  Parser.h
//  identityx_api
//
//  Created by Jonny Mortensen on 5/3/11.
//  Copyright 2011 Daon. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol IXParser <NSObject>
    
- (NSDictionary*)parse:(NSData*)data;

@end
