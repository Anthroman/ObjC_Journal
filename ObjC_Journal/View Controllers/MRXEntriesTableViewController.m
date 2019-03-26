//
//  MRXEntriesTableViewController.m
//  ObjC_Journal
//
//  Created by Alex Lundquist on 3/25/19.
//  Copyright © 2019 Alex Lundquist. All rights reserved.
//

#import "MRXEntriesTableViewController.h"
#import "MRXEntry.h"
#import "MRXEntryController.h"
#import "MRXEntryDetailViewController.h"

@interface MRXEntriesTableViewController ()

@end

@implementation MRXEntriesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return MRXEntryController.sharedInstance.entries.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"entryCell" forIndexPath:indexPath];
    
    MRXEntry *entry = MRXEntryController.sharedInstance.entries[indexPath.row];
    cell.textLabel.text = entry.title;
    
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateStyle:NSDateFormatterShortStyle];
    [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
    cell.detailTextLabel.text = [dateFormatter stringFromDate:entry.timestamp];
    return cell;
}


//MARK: - Navigation


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"cellSegue"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        MRXEntryDetailViewController *destinationVC = [segue destinationViewController];
        MRXEntry *entry = MRXEntryController.sharedInstance.entries[indexPath.row];
        destinationVC.entry = entry;
    }
}


@end
