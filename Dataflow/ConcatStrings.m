//
//  DfConcatStrings.m
//  Dataflow
//
//  Created by Administrator on 11/02/16.
//  Copyright © 2016 ISS. All rights reserved.
//

#import "Dataflow.h"

@implementation DfConcatStrings {
    NSString *invalidateSelString, *evaluateSelString;
}

- (instancetype)init {
    if (self = [super init]) {
        invalidateSelString = NSStringFromSelector(@selector(invalidate));
        evaluateSelString = NSStringFromSelector(@selector(evaluate));
    }
    return self;
}

- (void)setInputStrings:(NSArray<DfVar<NSString *> *> *)inputStrings {
    if (_inputStrings)
        for (DfSocket* s in _inputStrings) {
            [s removeConnection:self];
            [invalidators removeObjectForKey:s];
        }
    
    [invalidators removeAllObjects];
    
    _inputStrings = inputStrings;
    for (DfSocket* sock in _inputStrings) {
        [sock addConnection:self];
        [invalidators setObject:invalidateSelString forKey:sock];
    }
    
    [self invalidate];
}

- (void)setOutput:(DfVar<NSString *> *)output {
    if (_output) _output.provider = nil;
    [evaluators removeObjectForKey:_output];

    _output = output;

    output.provider = self;
    [evaluators setObject:evaluateSelString forKey:output];
    [output tap];
}

- (void)evaluate {
    NSMutableString* result = [NSMutableString new];
    for (DfVar<NSString*>* var in _inputStrings)
        [result appendString:var.value];
    _output.value = result;
}

- (void)invalidate {
    [_output invalidate];
}

- (void)autocreateOutputVariables {
    self.output = [DfVar<NSString*> new];
}

@end
