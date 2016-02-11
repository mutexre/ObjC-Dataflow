//
//  Transform.h
//  Dataflow
//
//  Created by Administrator on 11/02/16.
//  Copyright © 2016 ISS. All rights reserved.
//

#define df_i
#define df_o

@interface DfTransform : NSObject<DfConnection, DfValueProvider> {
    NSMapTable<DfSocket*, NSString*> *invalidators, *evaluators;
}

- (void)autocreateOutputVariables;

@end
