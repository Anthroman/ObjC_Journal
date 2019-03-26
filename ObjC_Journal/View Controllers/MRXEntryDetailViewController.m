//
//  MRXEntryDetailViewController.m
//  ObjC_Journal
//
//  Created by Alex Lundquist on 3/25/19.
//  Copyright © 2019 Alex Lundquist. All rights reserved.
//

#import "MRXEntryDetailViewController.h"
#import "MRXEntry.h"

@interface MRXEntryDetailViewController ()

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextView *bodyTextView;

@end

@implementation MRXEntryDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self updateViews];
}

- (void)updateViews
{
    if (self.entry) {
        self.titleTextField.text = self.entry.title;
        self.bodyTextView.text = self.entry.text;
    }
}

- (IBAction)clearButtonTapped:(id)sender
{
    self.titleTextField.text = @"";
    self.bodyTextView.text = @"";
}

- (IBAction)saveButtonTapped:(id)sender
{
    if (self.entry) {
        [[MRXEntryController sharedInstance] modifyEntry:self.entry withTitle:self.titleTextField.text text:self.bodyTextView.text];
    }else{
        MRXEntry *entry = [[MRXEntry alloc] initWithTitle:self.titleTextField.text text:self.bodyTextView.text timestamp:[NSDate date]];
        [[MRXEntryController sharedInstance] addEntry:entry];
    }
    [self.navigationController popViewControllerAnimated:YES];
}

@end
