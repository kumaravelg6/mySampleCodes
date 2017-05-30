// COPYRIGHT © 2010 by Daon Holdings Limited. All rights reserved.
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

@class IXTransaction;
@class IXResponse;

@protocol IXTransactionDelegate <NSObject>

@required


- (void) transaction:(IXTransaction*)transaction succeededWithResponse:(IXResponse*)response;
- (void) transaction:(IXTransaction*)transaction failedWithError:(NSError*)error;

@end