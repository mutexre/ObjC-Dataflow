//
//  Protocols.h
//  Dataflow
//
//  Created by Administrator on 11/02/16.
//  Copyright © 2016 ISS. All rights reserved.
//

@protocol DFConnection
- (void)receive:(DFSocket*)socket;
@end

@protocol DFValueProvider <NSObject>
- (void)evaluate:(DFVar*)var;
@end
