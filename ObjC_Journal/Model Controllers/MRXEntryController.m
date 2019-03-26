//
//  MRXEntryController.m
//  ObjC_Journal
//
//  Created by Alex Lundquist on 3/25/19.
//  Copyright © 2019 Alex Lundquist. All rights reserved.
//

#import "MRXEntryController.h"

@implementation MRXEntryController


//MARK: - Properties
+ (MRXEntryController *)sharedInstance //SharedInstance - Singleton
{
    static MRXEntryController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[MRXEntryController alloc] init];
        sharedInstance.entries = [NSMutableArray new];
        [sharedInstance loadFromPersistentStore];
    });
    return sharedInstance;
}

//MARK: - CRUD

//PersistentStore
//Save
- (void)saveToPersistentStore
{
    NSMutableArray *entryDictionaries = [NSMutableArray new];
    for (MRXEntry * entry in self.entries) {
        [entryDictionaries addObject:entry.dictionaryRepresentation];
    }
    [[NSUserDefaults standardUserDefaults] setObject:entryDictionaries forKey:@"Entries"];
}
//Load
- (void)loadFromPersistentStore
{
    NSArray *entryDictionaries = [[NSUserDefaults standardUserDefaults] objectForKey:@"Entries"];
    for (NSDictionary*dictoinary in entryDictionaries) {
        MRXEntry *entry = [[MRXEntry new] initWithDictionary:dictoinary];
        [self addEntry:entry];
    }
}

//Create
- (void)addEntry:(MRXEntry *)entry
{
    [self.entries addObject:entry];
    [self saveToPersistentStore];
}
//Update
- (void)modifyEntry:(MRXEntry *)entry withTitle:(NSString *)title text:(NSString *)text
{
    entry.title = title;
    entry.text = text;
    [self saveToPersistentStore];
}
//Delete
- (void)removeEntry:(MRXEntry *)entry
{
    [self.entries removeObject:entry];
    [self saveToPersistentStore];
}
@end
