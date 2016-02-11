//
//  main.m
//  Dataflow
//
//  Created by Administrator on 10/02/16.
//  Copyright © 2016 ISS. All rights reserved.
//

#import <Dataflow/Dataflow.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        DfConcatStrings* concat = [DfConcatStrings new];
        NSLog(@"%@", concat.output.value);
        
        concat.inputStrings = @[ DfVarMake(@"abc"), DfVarMake(@" "), DfVarMake(@"def") ];
        NSLog(@"%@", concat.output.value);

        concat.output = [DfVar<NSString*> new];
        NSLog(@"%@", concat.output.value);
        
        concat.inputStrings[1].value = @"+";
        NSLog(@"%@", concat.output.value);
    }
    return 0;
}
