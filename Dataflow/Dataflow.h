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

@class DFSocket;
@protocol DFConnection;
@protocol DFValueProvider;
@class DFVar;
@class DFTransform;

#import <Dataflow/Protocols.h>
#import <Dataflow/Socket.h>
#import <Dataflow/Var.h>
#import <Dataflow/Transform.h>
#import <Dataflow/Module.h>
#import <Dataflow/ConcatStrings.h>
