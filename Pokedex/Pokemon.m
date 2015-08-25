//
//  Pokemon.m
//  Pokedex
//
//  Created by Derek Argueta on 8/24/15.
//  Copyright (c) 2015 Derek Argueta. All rights reserved.
//

#import "Pokemon.h"

@implementation Pokemon

- (id)init:(NSString *)name number:(int)num height:(int)height weight:(int)weight baseXP:(int)baseXP {
    self = [super init];
    if(!self) return nil;
    
    self.name = [name stringByReplacingCharactersInRange:NSMakeRange(0,1) withString:[[name substringToIndex:1] uppercaseString]];
    self.number = num;
    self.height = height;
    self.weight = weight;
    self.baseExperience = baseXP;
    self.img = nil;
    
    return self;
}

@end
