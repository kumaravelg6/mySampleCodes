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

#import "IXRequestDelegate.h"

@interface IXNet : NSObject

/*
 Add a soap request.
 
 Body:
 
 <?xml version=\"1.0\" encoding=\"utf-8\"?>\n
 <soap:Envelope xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">
 <soap:Body>
 
 ...
 
 </soap:Body>
 </soap:Envelope>
 
 */ 

+ (void) addSoapRequestWithUrl:(NSURL*)url action:(NSString*)action body:(NSString*)xml delegate:(id<IXRequestDelegate>)requestDelegate;

+ (IXRequest*) soapRequestWithUrl:(NSURL*)url action:(NSString*)action body:(NSString*)xml itemtags:(NSArray*)tags;

+ (void) addRequest:(IXRequest*)request delegate:(id<IXRequestDelegate>)requestDelegate;
+ (void) addRequest:(IXRequest*)request trustCertificate:(BOOL)trust delegate:(id<IXRequestDelegate>)requestDelegate;

@end
