//
//  DfVar.m
//  Dataflow
//
//  Created by Administrator on 11/02/16.
//  Copyright © 2016 ISS. All rights reserved.
//

#import <Dataflow/Dataflow.h>

@implementation DFVar

@synthesize value = _value;

- (instancetype)init {
    if (self = [super init]) {
        _valid = NO;
    }
    return self;
}

- (instancetype)initWithValue:(id)value {
    if (self = [super init]) {
        _valid = YES;
        _value = value;
    }
    return self;
}

+ (instancetype)varWithValue:(id)value {
    return [[DFVar alloc] initWithValue:value];
}

- (void)evaluateIfNeeded {
    if (!_valid) [self.provider evaluate:self];
}

- (id)value {
    [self evaluateIfNeeded];
    return _value;
}

- (void)setValue:(id)value {
    _value = value;
    [self commit];
}

- (void)setValueNoCommit:(id)value {
    _value = value;
}

- (id)instantValue {
    return _value;
}

- (void)setProvider:(id<DFValueProvider>)provider {
    _provider = provider;
    _valid = NO;
}

- (void)commit:(BOOL)notify {
    _valid = YES;
    if (notify) [self tap];
}

- (void)commit {
    [self commit:YES];
}

- (void)invalidate:(BOOL)notify {
    _valid = NO;
    if (notify) [self tap];
}

- (void)invalidate {
    [self invalidate:YES];
}

@end
