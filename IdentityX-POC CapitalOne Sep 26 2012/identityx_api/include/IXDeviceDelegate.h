// COPYRIGHT © 2010-2012 by Daon Holdings Limited. All rights reserved.
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


@protocol IXDeviceDelegate <NSObject>;

@required

- (void) deviceListReceived:(NSArray*)devices;
- (void) deviceCodeReceived:(NSString*)code;
- (void) deviceAddComplete;


- (void) failedWithError:(NSError*)error;

@end