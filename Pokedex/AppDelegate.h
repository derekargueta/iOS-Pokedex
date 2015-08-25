//
//  AppDelegate.h
//  Pokedex
//
//  Created by Derek Argueta on 8/24/15.
//  Copyright (c) 2015 Derek Argueta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Pokemon.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

+ (NSArray*)getList;

@end

