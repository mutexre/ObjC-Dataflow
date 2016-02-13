//
//  DFFunction.h
//  Dataflow
//
//  Created by mutexre on 11/02/16.
//  Copyright © 2016 ISS. All rights reserved.
//

@interface DFFunction : DFTransform {
    NSString *invalidateSelString, *evaluateSelString;
}

DFInput @property (nonatomic, strong) DFVar* input;
DFOutput @property (nonatomic, strong) DFVar* output;

/*- (DFVar*)output;
- (void)setOutput:(DFVar*)output;*/

- (void)invalidate;

@end
