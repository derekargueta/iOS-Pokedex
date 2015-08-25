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
    
    pokeTable = [[UITableView alloc] init];
    pokeTable.frame = CGRectMake(10, 270, 140, 230);
    pokeTable.dataSource = self;
    pokeTable.delegate = self;
    pokeTable.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    [pokeTable registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    [pokeTable reloadData];
    [self.view addSubview:pokeTable];
    
    pokeView = [[UIImageView alloc] init];
    pokeView.frame = CGRectMake(200, 270, 150, 230);
    [pokeView setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:pokeView];
    
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
    
    [self.view bringSubviewToFront:self.pokedexCover];
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

#pragma mark - TableView DataSource Implementation
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[AppDelegate getList] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:cellIdentifier];
    }
    
    cell.backgroundView = [[UIView alloc] init];
    [cell.backgroundView setBackgroundColor:[UIColor clearColor]];
//    [[[cell contentView] subviews] makeObjectsPerformSelector:@selector]
    
    
    Pokemon *tmpPoke = (Pokemon *)[[AppDelegate getList] objectAtIndex:[indexPath row] + 1];
    cell.textLabel.text = tmpPoke.name;
    
    NSLog(@"grabbin name %@", tmpPoke.name);
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"something happening?");
    Pokemon *tmp = (Pokemon*)[[AppDelegate getList] objectAtIndex:[indexPath row] + 1];
    NSLog(@"%@", tmp.name);
    pokeView.image = tmp.img;
}

@end
