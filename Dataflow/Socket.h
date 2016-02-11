//
//  DfSocket.h
//  Dataflow
//
//  Created by Administrator on 11/02/16.
//  Copyright © 2016 ISS. All rights reserved.
//

@interface DfSocket : NSObject

- (void)addConnection:(id<DfConnection>)conn;
- (void)removeConnection:(id<DfConnection>)conn;
- (void)removeAllConnections;

- (void)tap;

@end
