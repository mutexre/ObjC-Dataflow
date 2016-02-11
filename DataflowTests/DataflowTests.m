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
    DFConcatStrings* concat = [DFConcatStrings new];
    XCTAssertEqual(concat.output.value, nil);
    
    concat.inputStrings = @[ DFVarMake(@"abc"), DFVarMake(@" "), DFVarMake(@"def") ];
    XCTAssertEqual(concat.output.value, nil);
    
    [concat autocreateOutputVariables];
    XCTAssert([concat.output.value isEqualToString:@"abc def"]);
    
    concat.output = [DFVar<NSString*> new];
    XCTAssert([concat.output.value isEqualToString:@"abc def"]);
    
    concat.inputStrings[1].value = @"+";
    XCTAssert([concat.output.value isEqualToString:@"abc+def"]);
}

@end
