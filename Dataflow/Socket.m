//
//  DfSocket.m
//  Dataflow
//
//  Created by Administrator on 11/02/16.
//  Copyright © 2016 ISS. All rights reserved.
//

#import "Dataflow.h"

@implementation DfSocket {
    NSMutableSet* connections;
}

- (instancetype)init {
    if (self = [super init]) {
        connections = [NSMutableSet new];
    }
    return self;
}

- (void)addConnection:(id<DfConnection>)conn {
    [connections addObject:conn];
}

- (void)removeConnection:(id<DfConnection>)conn {
    [connections removeObject:conn];
}

- (void)removeAllConnections {
    [connections removeAllObjects];
}

- (void)tap {
    for (id<DfConnection> conn in connections)
        [conn receive:self];
}

@end
