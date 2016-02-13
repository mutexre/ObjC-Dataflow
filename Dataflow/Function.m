//
//  DFFunction.m
//  Dataflow
//
//  Created by mutexre on 11/02/16.
//  Copyright © 2016 ISS. All rights reserved.
//

#import <Dataflow/Dataflow.h>

@implementation DFFunction

- (instancetype)init {
    if (self = [super init]) {
        invalidateSelString = NSStringFromSelector(@selector(invalidate));
        evaluateSelString = NSStringFromSelector(@selector(evaluate));
    }
    return self;
}

- (void)setInput:(DFVar<id<NSFastEnumeration>>*)input {
    if (self.input) {
        [self.input removeConnection:self];
        [invalidators removeObjectForKey:self.input];
    }
    
    [invalidators removeAllObjects];
    
    _input = input;
    [input addConnection:self];
    [invalidators setObject:invalidateSelString forKey:input];
    
    [self invalidate];
}

- (void)setOutput:(DFVar<NSString *> *)output {
    if (self.output) self.output.provider = nil;
    [evaluators removeObjectForKey:self.output];

    _output = output;

    output.provider = self;
    [evaluators setObject:evaluateSelString forKey:output];
    [output tap];
}

- (void)invalidate {
    [self.output invalidate];
}

- (void)autocreateOutputVariables {
    self.output = [DFVar new];
}

@end
