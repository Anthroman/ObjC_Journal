//
//  MRXEntry.h
//  ObjC_Journal
//
//  Created by Alex Lundquist on 3/25/19.
//  Copyright © 2019 Alex Lundquist. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MRXEntry : NSObject

//Properties -
//always start with a "@property" and then -> "()" not what the hell that is or what goes in it exactly or why.
//Then its the property type.. in this case NSString
//you finish off by placing a pointer "*" and the property name in this case "title" terminate with a ";"
@property (nonatomic) NSString *title;
@property (nonatomic) NSString *text;
@property (nonatomic) NSDate* timestamp;

//Initializers -
//this is a instancetype
- (instancetype) initWithTitle: (NSString *)title
                          text:(NSString *)text
                     timestamp:(NSDate *)timestamp;

- (instancetype) initWithDictionary:(NSDictionary *)dictionary;

- (NSDictionary *)dictionaryRepresentation;

@end

NS_ASSUME_NONNULL_END
