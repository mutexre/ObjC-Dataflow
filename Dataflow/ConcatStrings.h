//
//  DfConcatStrings.h
//  Dataflow
//
//  Created by Administrator on 11/02/16.
//  Copyright © 2016 ISS. All rights reserved.
//

@interface DFConcatStrings : DFTransform

DFInput @property (nonatomic, strong) NSArray<DFVar<NSString*>*>* inputStrings;
DFOutput @property (nonatomic, strong) DFVar<NSString*>* output;

@end
