//
//  Brain.h
//  AppCalculatorObjc
//
//  Created by Fabio Lindemberg on 30/06/20.
//  Copyright © 2020 Fabio Lindemberg. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef  NS_ENUM(NSInteger, Operation) {
    Subtraction,
    Sum,
    Division,
    Multiplication,
    None
};

@protocol BrainDelegate <NSObject>

- (void) updateUI:(NSString*) value
        operation:(NSString*) operation;
@end

@interface Brain : NSObject

@property (nonatomic, weak) id<BrainDelegate> delegate;

-(void) addValueFrom:(NSString*) value;
-(void) setOperation:(Operation) operation;
-(void) clear;
-(void) calc;
@end

NS_ASSUME_NONNULL_END
