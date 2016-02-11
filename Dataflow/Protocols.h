//
//  Protocols.h
//  Dataflow
//
//  Created by Administrator on 11/02/16.
//  Copyright © 2016 ISS. All rights reserved.
//

@protocol DfConnection
- (void)receive:(DfSocket*)socket;
@end

@protocol DfValueProvider <NSObject>
- (void)evaluate:(DfVar*)var;
@end
