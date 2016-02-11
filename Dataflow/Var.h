//
//  DfVar.h
//  Dataflow
//
//  Created by Administrator on 11/02/16.
//  Copyright © 2016 ISS. All rights reserved.
//

#define DfVarMake(var) [DfVar varWithValue:var]

@interface DfVar<__covariant T> : DfSocket

@property (nonatomic, weak) id<DfValueProvider> provider;
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
