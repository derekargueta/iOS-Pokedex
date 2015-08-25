//
//  Netwerker.h
//  Pokedex
//
//  Created by Derek Argueta on 8/24/15.
//  Copyright (c) 2015 Derek Argueta. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "Pokemon.h"

@interface Netwerker : NSObject

// Makes network call to fetch all pokemon
- (void)fetchPokemonList;

@end
