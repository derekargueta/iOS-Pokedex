//
//  ViewController.m
//  Pokedex
//
//  Created by Derek Argueta on 8/24/15.
//  Copyright (c) 2015 Derek Argueta. All rights reserved.
//

#import "ViewController.h"

@interface ViewController()
@property (weak, nonatomic) IBOutlet UIImageView *wallpaper;
@property (weak, nonatomic) IBOutlet UILabel *openTextLabel;
@property (weak, nonatomic) IBOutlet UIImageView *pokedexCover;

// Runs the animation for "opening" the pokedex
- (void)openPokedex;

// Runs the animation for "closing" the pokedex
- (void)closePokedex;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // set up swipe-right to open the pokedex
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                                                                     action:@selector(openPokedex)];
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    [self.pokedexCover setUserInteractionEnabled:YES];
    [self.pokedexCover addGestureRecognizer:swipeRight];
    
    // set up swipe-left to close the pokedex
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                                                                    action:@selector(closePokedex)];
    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.wallpaper setUserInteractionEnabled:YES];
    [self.wallpaper addGestureRecognizer:swipeLeft];
}

- (void)openPokedex {
    [UIView animateWithDuration:0.2 animations:^{
        self.pokedexCover.frame = CGRectMake(self.pokedexCover.frame.size.width, self.pokedexCover.frame.origin.y, 0, self.pokedexCover.frame.size.height);
        self.openTextLabel.hidden = YES;
    }];
}

- (void)closePokedex {
    [UIView animateWithDuration:0.2 animations:^{
        self.pokedexCover.frame = CGRectMake(0, self.pokedexCover.frame.origin.y, self.view.frame.size.width, self.pokedexCover.frame.size.height);
        self.openTextLabel.hidden = NO;
    }];
}

@end
