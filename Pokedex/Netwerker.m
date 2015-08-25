//
//  Netwerker.m
//  Pokedex
//
//  Created by Derek Argueta on 8/24/15.
//  Copyright (c) 2015 Derek Argueta. All rights reserved.
//

#import "Netwerker.h"

@implementation Netwerker

NSString * const POKEMON_LIST_URL = @"http://pokeapi.co/api/v1/pokedex/1/";

- (void)fetchPokemonList {
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:POKEMON_LIST_URL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSArray *pokeList = (NSArray *)[responseObject objectForKey:@"pokemon"];
        for(id item in pokeList) {
            NSDictionary *pokedata = (NSDictionary *)item;
            if ([[pokedata objectForKey:@"name"] rangeOfString:@"mega"].location == NSNotFound) {
                Pokemon *poke = [[Pokemon alloc] init:pokedata];
            }
            
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

@end
