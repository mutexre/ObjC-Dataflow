//
//  Filter.h
//  Dataflow
//
//  Created by mutexre on 11/02/16.
//  Copyright © 2016 ISS. All rights reserved.
//

#import <Dataflow/Dataflow.h>

typedef BOOL (^Filter)(id);

@interface DFFilter : DFFunction

@property (copy) Filter f;

DFInput @property (nonatomic, strong) DFVar<id<NSFastEnumeration>>* input;
DFOutput @property (nonatomic, strong) DFVar* output;

@end
