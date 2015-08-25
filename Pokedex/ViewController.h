//
//  ViewController.h
//  Pokedex
//
//  Created by Derek Argueta on 8/24/15.
//  Copyright (c) 2015 Derek Argueta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "Pokemon.h"

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
    UITableView *pokeTable;
    UIImageView *pokeView;
}


@end

