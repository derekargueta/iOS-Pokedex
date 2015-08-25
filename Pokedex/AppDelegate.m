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
  int count = 0;
    for(id row in rows) {
      if(count > 0) {
        NSArray *columns = [row componentsSeparatedByString:@","];
        if([columns count] > 3 /*&& [[columns objectAtIndex:1] rangeOfString:@"-"].location == NSNotFound*/) {
            Pokemon *tmpPoke = [[Pokemon alloc] init:[columns objectAtIndex:1]
                           number:(int)[[columns objectAtIndex:2] integerValue]
                           height:(int)[[columns objectAtIndex:3] integerValue]
                           weight:(int)[[columns objectAtIndex:4] integerValue]
                           baseXP:(int)[[columns objectAtIndex:5] integerValue]];
            [pokeList addObject:tmpPoke];
        }
      }
      count++;
    }

    return YES;
}

+ (NSArray*)getList {
    return pokeList;
}

@end
