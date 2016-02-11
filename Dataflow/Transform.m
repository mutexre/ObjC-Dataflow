//
//  Transform.m
//  Dataflow
//
//  Created by Administrator on 11/02/16.
//  Copyright © 2016 ISS. All rights reserved.
//

#import <Dataflow/Dataflow.h>

@implementation DFTransform

- (instancetype)init {
    if (self = [super init]) {
        invalidators = [NSMapTable mapTableWithKeyOptions:NSPointerFunctionsWeakMemory | NSPointerFunctionsOpaquePersonality
                                             valueOptions:NSPointerFunctionsStrongMemory];

        evaluators = [NSMapTable mapTableWithKeyOptions:NSPointerFunctionsWeakMemory | NSPointerFunctionsOpaquePersonality
                                           valueOptions:NSPointerFunctionsStrongMemory];
    }
    return self;
}

- (void)invoke:(NSMapTable*)map sock:(DFSocket*)sock {
    NSString* selString = [map objectForKey:sock];
    SEL sel = NSSelectorFromString(selString);
    [self performSelector:sel];
}

- (void)receive:(DFSocket*)inputVar {
    [self invoke:invalidators sock:inputVar];
}

- (void)evaluate:(DFVar*)outputVar {
    [self invoke:evaluators sock:outputVar];
}

- (void)autocreateOutputVariables {}

@end
