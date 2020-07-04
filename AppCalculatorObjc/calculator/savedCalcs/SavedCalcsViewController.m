//
//  SavedCalcsViewController.m
//  AppCalculatorObjc
//
//  Created by Fabio Lindemberg on 03/07/20.
//  Copyright © 2020 Fabio Lindemberg. All rights reserved.
//

#import "SavedCalcsViewController.h"

@interface SavedCalcsViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation SavedCalcsViewController

NSMutableArray *calcs;

- (void)viewDidLoad {
    [super viewDidLoad];
    _tbCalcs.tableFooterView = [[UIView alloc]init];
}

- (void) loadData {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];

    calcs = [[userDefaults arrayForKey:@"calcs"] mutableCopy];
    
    if (calcs == nil) {
        calcs = [[NSMutableArray alloc] init];
    }
}

- (void)viewDidAppear:(BOOL)animated {
    [self loadData];
    [_tbCalcs reloadData];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = calcs[indexPath.row];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [calcs  count];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    return @"Delete";
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
         NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
         calcs = [[userDefaults arrayForKey:@"calcs"] mutableCopy];

         if (calcs == nil){
             return;
         }
         
        [calcs removeObjectAtIndex:indexPath.row];

         [userDefaults setObject:calcs forKey:@"calcs"];
         [userDefaults synchronize];
         [tableView reloadData]; // tell table to refresh now
     }
}

@end
