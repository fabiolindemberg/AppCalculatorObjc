//
//  ViewController.h
//  AppCalculatorObjc
//
//  Created by Fabio Lindemberg on 20/06/20.
//  Copyright © 2020 Fabio Lindemberg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Brain.h"

@interface CalculatorViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *txtDescription;
@property (weak, nonatomic) IBOutlet UILabel *lblDisplay;
@property (weak, nonatomic) IBOutlet UILabel *lblOperationDisplay;

- (IBAction)btn:(id)sender;
- (IBAction)clear:(id)sender;
- (IBAction)operation:(id)sender;
- (IBAction)calc:(id)sender;

@end

    
