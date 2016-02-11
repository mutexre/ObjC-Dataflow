//
//  DfConcatStrings.h
//  Dataflow
//
//  Created by Administrator on 11/02/16.
//  Copyright © 2016 ISS. All rights reserved.
//

@interface DfConcatStrings : DfTransform

df_i @property (nonatomic, strong) NSArray<DfVar<NSString*>*>* inputStrings;
df_o @property (nonatomic, strong) DfVar<NSString*>* output;

- (void)evaluate;
- (void)invalidate;

@end
