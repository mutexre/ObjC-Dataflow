//
//  Transform.m
//  Dataflow
//
//  Created by Administrator on 11/02/16.
//  Copyright © 2016 ISS. All rights reserved.
//

#import "Dataflow.h"

@implementation DfTransform

- (instancetype)init {
    if (self = [super init]) {
        invalidators = [NSMapTable mapTableWithKeyOptions:NSPointerFunctionsWeakMemory | NSPointerFunctionsOpaquePersonality
                                             valueOptions:NSPointerFunctionsStrongMemory];

        evaluators = [NSMapTable mapTableWithKeyOptions:NSPointerFunctionsWeakMemory | NSPointerFunctionsOpaquePersonality
                                           valueOptions:NSPointerFunctionsStrongMemory];
    }
    return self;
}

- (void)invoke:(NSMapTable*)map sock:(DfSocket*)sock {
    NSString* selString = [map objectForKey:sock];
    SEL sel = NSSelectorFromString(selString);
    [self performSelector:sel];
}

- (void)receive:(DfSocket *)inputVar {
    [self invoke:invalidators sock:inputVar];
}

- (void)evaluate:(DfVar*)outputVar {
    [self invoke:evaluators sock:outputVar];
}

- (void)autocreateOutputVariables {}

@end
