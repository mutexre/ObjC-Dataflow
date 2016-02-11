//
//  DfConcatStrings.m
//  Dataflow
//
//  Created by Administrator on 11/02/16.
//  Copyright © 2016 ISS. All rights reserved.
//

#import "Dataflow.h"

@implementation DFConcatStrings {
    NSString *invalidateSelString, *evaluateSelString;
}

- (instancetype)init {
    if (self = [super init]) {
        invalidateSelString = NSStringFromSelector(@selector(invalidate));
        evaluateSelString = NSStringFromSelector(@selector(evaluate));
    }
    return self;
}

- (void)setInputStrings:(NSArray<DFVar<NSString *> *> *)inputStrings {
    if (_inputStrings)
        for (DFSocket* s in _inputStrings) {
            [s removeConnection:self];
            [invalidators removeObjectForKey:s];
        }
    
    [invalidators removeAllObjects];
    
    _inputStrings = inputStrings;
    for (DFSocket* sock in _inputStrings) {
        [sock addConnection:self];
        [invalidators setObject:invalidateSelString forKey:sock];
    }
    
    [self invalidate];
}

- (void)setOutput:(DFVar<NSString *> *)output {
    if (_output) _output.provider = nil;
    [evaluators removeObjectForKey:_output];

    _output = output;

    output.provider = self;
    [evaluators setObject:evaluateSelString forKey:output];
    [output tap];
}

- (void)evaluate {
    NSMutableString* result = [NSMutableString new];
    for (DFVar<NSString*>* var in _inputStrings)
        [result appendString:var.value];
    _output.value = result;
}

- (void)invalidate {
    [_output invalidate];
}

- (void)autocreateOutputVariables {
    self.output = [DFVar<NSString*> new];
}

@end
