//
//  Transform.h
//  Dataflow
//
//  Created by Administrator on 11/02/16.
//  Copyright © 2016 ISS. All rights reserved.
//

#define DFInput
#define DFOutput

@interface DFTransform : NSObject<DFConnection, DFValueProvider> {
    NSMapTable<DFSocket*, NSString*> *invalidators, *evaluators;
}

- (void)autocreateOutputVariables;

@end
