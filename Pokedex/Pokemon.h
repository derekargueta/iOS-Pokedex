//
//  Pokemon.h
//  Pokedex
//
//  Created by Derek Argueta on 8/24/15.
//  Copyright (c) 2015 Derek Argueta. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "AFNetworking.h"

@interface Pokemon : NSObject

- (id)init:(NSDictionary *)pokedata;
- (id)init:(NSString *)name number:(int)num height:(int)height weight:(int)weight baseXP:(int)baseXP;

@property NSString *detailEndpoint;

// The pokemon's numerical value in the pokedex - decides order
@property int number;

@property int height;
@property int weight;
@property int baseExperience;

@property NSString *name;

@property UIImage *img;

@end
