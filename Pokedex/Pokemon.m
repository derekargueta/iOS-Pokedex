//
//  Pokemon.m
//  Pokedex
//
//  Created by Derek Argueta on 8/24/15.
//  Copyright (c) 2015 Derek Argueta. All rights reserved.
//

#import "Pokemon.h"

@implementation Pokemon

NSString * const BASE_URL = @"http://pokeapi.co/";

- (id)init:(NSString *)name number:(int)num height:(int)height weight:(int)weight baseXP:(int)baseXP {
    self = [super init];
    if(!self) return nil;
    
    self.name = name;
    self.number = num;
    self.height = height;
    self.weight = weight;
    self.baseExperience = baseXP;
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:[NSString stringWithFormat:@"%@media/img/%i.png", BASE_URL, self.number]
      parameters:nil
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             self.img = [UIImage imageWithData:(NSData *)responseObject];
         } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             NSLog(@"Error: %@", error);
         }
     ];
    
    return self;
}

@end
