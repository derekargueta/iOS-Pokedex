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

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(navToNextScreen)];
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    [self.pokedexCover setUserInteractionEnabled:YES];
    [self.pokedexCover addGestureRecognizer:swipeRight];
}

- (void)navToNextScreen {
    
    [UIView animateWithDuration:0.2 animations:^{
        self.pokedexCover.frame = CGRectMake(self.pokedexCover.frame.size.width, self.pokedexCover.frame.origin.y, 0, self.pokedexCover.frame.size.height);
        self.openTextLabel.hidden = YES;
    }];
}

@end
