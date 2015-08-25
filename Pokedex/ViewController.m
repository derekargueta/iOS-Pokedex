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

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(navToNextScreen)];
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    [self.wallpaper setUserInteractionEnabled:YES];
    [self.wallpaper addGestureRecognizer:swipeRight];
}

- (void)navToNextScreen {
//    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    PokedexMainViewController *pmvc = (PokedexMainViewController *)[sb instantiateViewControllerWithIdentifier:@"poke-main"];
//    [self.navigationController pushViewController:pmvc animated:YES];
    
    [UIView animateWithDuration:0.2 animations:^{
        self.wallpaper.frame = CGRectMake(self.wallpaper.frame.size.width, self.wallpaper.frame.origin.y, 0, self.wallpaper.frame.size.height);
        self.openTextLabel.hidden = YES;
    }];
}

@end
