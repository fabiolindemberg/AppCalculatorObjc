//
//  ViewController.m
//  AppCalculatorObjc
//
//  Created by Fabio Lindemberg on 20/06/20.
//  Copyright © 2020 Fabio Lindemberg. All rights reserved.
//

#import "CalculatorViewController.h"
#import "Brain.h"

@interface CalculatorViewController () <BrainDelegate>

@end

@implementation CalculatorViewController

Brain * brain;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    brain = [[Brain alloc] init];
    brain.delegate = self;
    [_lblDisplay setText:@"0"];
}

- (IBAction)btn:(id)sender {
    
    // cast sender:id to UIButton
    UIButton* button = ((UIButton *)sender);
    
    // get button's title value
    NSString* value = button.titleLabel.text;
    
    // MARK: set numbers
    [brain addValueFrom:value];
}

- (IBAction)clear:(id)sender {
    [brain clear];
}

- (IBAction)operation:(id)sender {
    
    // cast sender:id to UIButton
    UIButton* button = ((UIButton *)sender);
    
    // get button's title value
    NSString* value = button.titleLabel.text;
    
    // MARK: set opetation
    
    if ([value isEqualToString:@"+"]) {
        [brain setOperation:Sum];
        return;
    }
    
    if ([value isEqualToString:@"/"]) {
        [brain setOperation:Division];
        return;
    }
    
    if ([value isEqualToString:@"-"]) {
        [brain setOperation:Subtraction];
        return;
    }
    
    if ([value isEqualToString:@"x"]) {
        [brain setOperation:Multiplication];
        return;
    }
}

- (IBAction)calc:(id)sender {
    [brain calc];
}

- (void)updateUI:(nonnull NSString *)value operation:(nonnull NSString *)operation {
    
    [_lblDisplay setText:value];
    [_lblOperationDisplay setText:operation];
}
@end


