//
//  main.m
//  Dataflow
//
//  Created by Administrator on 10/02/16.
//  Copyright © 2016 ISS. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DfObservable;

@protocol DfObserver
- (void)observe:(DfObservable*)obj;
@end

@interface DfObservable {
    NSMutableArray* observers;
}

- (void)addObserver:(id<DfObserver>)obj;
- (void)notify;

@end

@interface NSNumber (Df)
- (void)invalidate;
@end

@interface DfTransform : NSObject
- (void)autocreateOutputVariables;
@end

#define df_in
#define df_out

@interface DfIn : NSObject
@end

@interface DfOut : NSObject
@end

@interface DfMultiply : DfTransform
df_in @property (nonatomic, strong) NSNumber* a;
df_in @property (nonatomic, strong) NSNumber* b;
df_out @property (nonatomic, strong) NSNumber* output;

- (void)evaluate;
- (void)invalidate;

@end

@implementation DfMultiply

@dynamic a, b, output;

- (void)evaluate {
    output = a * b;
}

- (void)invalidate {
    [self.c invalidate];
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        DfMultiply* mul = [DfMultiply new];
        NSLog(@"", mul.output);
        mul.a = @2;
        mul.b = @2;
        mul.c = [NSNumber new];
        [mul autocreateOutputVariables];
    }
    return 0;
}
