//
//  AppDelegate.m
//  Pokedex
//
//  Created by Derek Argueta on 8/24/15.
//  Copyright (c) 2015 Derek Argueta. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

NSMutableArray *pokeList;

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    pokeList = [[NSMutableArray alloc] init];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"pokemon" ofType:@"csv"];
    
    NSError *err = nil;
    NSString *fileContents = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&err];
    NSArray *rows = [fileContents componentsSeparatedByString:@"\n"];
    for(id row in rows) {
        NSArray *columns = [row componentsSeparatedByString:@","];
        if([columns count] > 3 && [[columns objectAtIndex:1] rangeOfString:@"-"].location == NSNotFound) {
        NSLog(@"id: %@, name: %@, species ID: %@, height: %@, weight: %@", [columns objectAtIndex:0], [columns objectAtIndex:1], [columns objectAtIndex:2], [columns objectAtIndex:3], [columns objectAtIndex:4]);
            [[Pokemon alloc] init:[columns objectAtIndex:1]
                           number:(int)[columns objectAtIndex:2]
                           height:(int)[columns objectAtIndex:3]
                           weight:(int)[columns objectAtIndex:4]
                           baseXP:(int)[columns objectAtIndex:5]];
        }
    }
    
//    Netwerker *n = [[Netwerker alloc] init];
//    [n fetchPokemonList];
    return YES;
}

+ (NSArray*)getList {
    return pokeList;
}

@end
