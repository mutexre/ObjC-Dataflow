//
//  Dataflow.h
//  Dataflow
//
//  Created by Administrator on 11/02/16.
//  Copyright © 2016 ISS. All rights reserved.
//

#import <Cocoa/Cocoa.h>

//! Project version number for Dataflow.
FOUNDATION_EXPORT double DataflowVersionNumber;

//! Project version string for Dataflow.
FOUNDATION_EXPORT const unsigned char DataflowVersionString[];

@class DfSocket;
@protocol DfConnection;
@protocol DfValueProvider;
@class DfVar;
@class DfTransform;

#import <Dataflow/Protocols.h>
#import <Dataflow/Socket.h>
#import <Dataflow/Var.h>
#import <Dataflow/Transform.h>
#import <Dataflow/ConcatStrings.h>
