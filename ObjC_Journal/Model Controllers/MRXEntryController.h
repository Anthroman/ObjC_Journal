//
//  MRXEntryController.h
//  ObjC_Journal
//
//  Created by Alex Lundquist on 3/25/19.
//  Copyright © 2019 Alex Lundquist. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MRXEntry.h"
NS_ASSUME_NONNULL_BEGIN

@interface MRXEntryController : NSObject

+ (MRXEntryController *)sharedInstance;
@property (nonatomic) NSMutableArray<MRXEntry*> *entries;

- (void)saveToPersistentStore;
- (void)loadFromPersistentStore;
- (void)addEntry:(MRXEntry *)entry;
- (void)removeEntry:(MRXEntry *)entry;
- (void)modifyEntry:(MRXEntry *)entry
          withTitle:(NSString *)title
               text:(NSString *)text;
@end

NS_ASSUME_NONNULL_END
