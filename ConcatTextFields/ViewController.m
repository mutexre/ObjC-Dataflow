//
//  ViewController.m
//  ConcatTextFields
//
//  Created by Administrator on 11/02/16.
//  Copyright © 2016 ISS. All rights reserved.
//

#import <Dataflow/Dataflow.h>
#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) IBOutlet NSTextField* firstTextField;
@property (nonatomic, strong) IBOutlet NSTextField* secondTextField;
@property (nonatomic, strong) IBOutlet NSTextField* resultTextField;

@end

@implementation ViewController {
    DFConcatStrings* concat;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    concat = [DFConcatStrings new];
    concat.inputStrings = @[ DFVarMake(self.firstTextField.stringValue), DFVarMake(self.secondTextField.stringValue) ];
    [concat autocreateOutputVariables];
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
}

- (void)controlTextDidChange:(NSNotification *)notification {
    NSTextField* textField = [notification object];
    concat.inputStrings[textField == self.firstTextField ? 0 : 1].value = textField.stringValue;
    self.resultTextField.stringValue = concat.output.value;
}

@end
