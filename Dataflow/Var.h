//
//  DfVar.h
//  Dataflow
//
//  Created by Administrator on 11/02/16.
//  Copyright © 2016 ISS. All rights reserved.
//

#define DFVarMake(var) [DFVar varWithValue:var]

@interface DFVar<__covariant T> : DFSocket

@property (nonatomic, weak) id<DFValueProvider> provider;
@property (nonatomic, readonly) BOOL valid;
@property (nonatomic, strong) T value;
@property (nonatomic, readonly) T instantValue;

- (instancetype)init;
- (instancetype)initWithValue:(T)value;

+ (instancetype)varWithValue:(T)value;

- (void)commit:(BOOL)notify;
- (void)commit;

- (void)invalidate:(BOOL)notify;
- (void)invalidate;

@end
