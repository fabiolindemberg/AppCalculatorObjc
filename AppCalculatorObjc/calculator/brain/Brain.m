//
//  Brain.m
//  AppCalculatorObjc
//
//  Created by Fabio Lindemberg on 30/06/20.
//  Copyright © 2020 Fabio Lindemberg. All rights reserved.
//
#import <Foundation/Foundation.h>

#import "Brain.h"

@implementation Brain: NSObject

NSString* firstValue;
NSString* secondValue;
NSString* resultDisplay;
Operation currentOperation;

- (instancetype)init {
    self = [super init];
    
    if (self) {
        currentOperation = None;
    }
    
    return self;
}

-(void) addValueFrom:(NSString*) value {
        
    NSString * zeroLeft = @"0";
    NSString * infinete = @"inf";
    
    if (currentOperation == None) {
    
        if ((firstValue == nil) ||
            ([firstValue isEqualToString: zeroLeft]) ||
            ([firstValue isEqualToString: infinete])) {
            firstValue = @"";
        }
                
        firstValue = [firstValue stringByAppendingString:value];
        
        [self updateUI:firstValue];
    } else {
        
        if ((secondValue == nil) ||
            ([secondValue isEqualToString: zeroLeft])) {
            secondValue = @"";
        }
                
        secondValue = [secondValue stringByAppendingString:value];

        [self updateUI:secondValue];
    }
}

-(void) setOperation:(Operation) operation {
    currentOperation = operation;
    [self updateUI:firstValue];
}

-(void) clear {
    firstValue = @"";
    secondValue = @"";
    currentOperation = None;
    [self updateUI:@"0"];
}

-(void) calc {
    
    float first = [firstValue floatValue];
    float second = [secondValue floatValue];
    float result = 0;
    
    switch (currentOperation) {
        case Sum:
            result = (first + second);
            break;
        case Subtraction:
            result = (first - second);
            break;
        case Division:
            result = (first / second);
            break;
        case Multiplication:
            result = (first * second);
            break;
        default:
            result = 0;
    }
    
    firstValue = [[NSNumber numberWithFloat:result] stringValue];
    secondValue = @"";
    currentOperation = None;
    
    [self updateUI:[[NSNumber numberWithFloat:result] stringValue]];
}

- (void) updateUI:(NSString*) value {
    
    NSString *operationSimbol;
    
    switch (currentOperation) {
        case Sum:
            operationSimbol = @"+";
            break;
        case Subtraction:
            operationSimbol = @"-";
                            break;
        case Division:
            operationSimbol = @"/";
            break;
        case Multiplication:
            operationSimbol = @"x";
            break;
        default:
            operationSimbol = @"";
    }
    
    [self.delegate updateUI:value operation:operationSimbol];
}

@end
