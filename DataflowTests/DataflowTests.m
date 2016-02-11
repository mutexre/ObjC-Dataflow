//
//  DataflowTests.m
//  DataflowTests
//
//  Created by Administrator on 11/02/16.
//  Copyright © 2016 ISS. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Dataflow/Dataflow.h>

@interface DataflowTests : XCTestCase

@end

@implementation DataflowTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testConcat {
    DfConcatStrings* concat = [DfConcatStrings new];
    XCTAssertEqual(concat.output.value, nil);
    
    concat.inputStrings = @[ DfVarMake(@"abc"), DfVarMake(@" "), DfVarMake(@"def") ];
    XCTAssertEqual(concat.output.value, nil);
    
    concat.output = [DfVar<NSString*> new];
    XCTAssert([concat.output.value isEqualToString:@"abc def"]);
    
    concat.inputStrings[1].value = @"+";
    XCTAssert([concat.output.value isEqualToString:@"abc+def"]);
}

@end
