//
//  DfSocket.m
//  Dataflow
//
//  Created by Administrator on 11/02/16.
//  Copyright © 2016 ISS. All rights reserved.
//

#import <Dataflow/Dataflow.h>

@implementation DFSocket {
    NSMutableSet* connections;
}

- (instancetype)init {
    if (self = [super init]) {
        connections = [NSMutableSet new];
    }
    return self;
}

- (void)addConnection:(id<DFConnection>)conn {
    [connections addObject:conn];
}

- (void)removeConnection:(id<DFConnection>)conn {
    [connections removeObject:conn];
}

- (void)removeAllConnections {
    [connections removeAllObjects];
}

- (void)tap {
    for (id<DFConnection> conn in connections)
        [conn receive:self];
}

@end
