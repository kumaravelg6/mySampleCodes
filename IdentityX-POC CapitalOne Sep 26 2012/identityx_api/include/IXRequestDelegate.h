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
#import "IXRequest.h"

@protocol IXRequestDelegate <NSObject>

- (void) request:(IXRequest*)request succeededWithInfo:(NSDictionary*)info;
- (void) request:(IXRequest*)request failedWithError:(NSError*)error;

@end
