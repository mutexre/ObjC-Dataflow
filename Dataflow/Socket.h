//
//  DfSocket.h
//  Dataflow
//
//  Created by Administrator on 11/02/16.
//  Copyright © 2016 ISS. All rights reserved.
//

@interface DFSocket : NSObject

- (void)addConnection:(id<DFConnection>)conn;
- (void)removeConnection:(id<DFConnection>)conn;
- (void)removeAllConnections;

- (void)tap;

@end
