//
//  MRXEntry.m
//  ObjC_Journal
//
//  Created by Alex Lundquist on 3/25/19.
//  Copyright © 2019 Alex Lundquist. All rights reserved.
//

#import "MRXEntry.h"

@implementation MRXEntry

//Initializers

- (instancetype) initWithTitle: (NSString *)title text:(NSString *)text timestamp:(NSDate *)timestamp
{
    //call super init
    self = [super init];
    if (self) {
        _title = title;
        _text = text;
        _timestamp = timestamp;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSString *title = dictionary[@"title"];
    NSString *text = dictionary[@"text"];
    NSDate *timestamp = dictionary[@"timestamp"];
    return [self initWithTitle:title text:text timestamp:timestamp];
}

- (NSDictionary *)dictionaryRepresentation
{
    return @{
             @"title": self.title,
             @"text": self.text,
             @"timestamp": self.timestamp
             };
}

@end
