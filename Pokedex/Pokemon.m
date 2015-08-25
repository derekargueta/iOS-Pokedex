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

- (id)init:(NSDictionary *)pokedata {
    self = [super init];
    if(!self) {
        return nil;
    }
    
    self.name = (NSString *)[pokedata objectForKey:@"name"];
    self.detailEndpoint = (NSString *)[pokedata objectForKey:@"resource_uri"];
    self.number = (int)[[[self.detailEndpoint componentsSeparatedByString:@"/"] objectAtIndex:3] integerValue];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString *reqUrl = [NSString stringWithFormat:@"%@media/img/%i.png", BASE_URL, self.number];
    [manager GET:reqUrl parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"good return: %@", responseObject);
        self.img = [UIImage imageWithData:(NSData*)responseObject];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];

    
    return self;
}

- (id)init:(NSString *)name number:(int)num height:(int)height weight:(int)weight baseXP:(int)baseXP {
    self = [super init];
    if(!self) return nil;
    
    self.name = name;
    self.number = num;
    self.height = height;
    self.weight = weight;
    self.baseExperience = baseXP;
    
    NSLog(@"created pokemon %@", self.name);
    
    return self;
}

@end
