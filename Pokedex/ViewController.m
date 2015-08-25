//
//  ViewController.m
//  Pokedex
//
//  Created by Derek Argueta on 8/24/15.
//  Copyright (c) 2015 Derek Argueta. All rights reserved.
//

#import "ViewController.h"

NSString * const BASE_URL = @"http://pokeapi.co/";

@interface ViewController()
@property (weak, nonatomic) IBOutlet UIImageView *wallpaper;
@property (weak, nonatomic) IBOutlet UILabel *openTextLabel;
@property (weak, nonatomic) IBOutlet UIImageView *pokedexCover;

@property Pokemon *selected;

// Runs the animation for "opening" the pokedex
- (void)openPokedex;

// Runs the animation for "closing" the pokedex
- (void)closePokedex;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    self.selected = nil;
    pokeTable = [[UITableView alloc] init];
    pokeTable.frame = CGRectMake(10, 270, 140, 310);
    pokeTable.dataSource = self;
    pokeTable.delegate = self;
    pokeTable.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    [pokeTable registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    [pokeTable reloadData];
    [self.view addSubview:pokeTable];
    
    pokeView = [[UIImageView alloc] init];
    pokeView.frame = CGRectMake(190, 320, 200, 200);
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
  NSLog(@"open pokedex called");
    [UIView animateWithDuration:0.2 animations:^{
        self.pokedexCover.frame = CGRectMake(self.pokedexCover.frame.size.width, self.pokedexCover.frame.origin.y, 0, self.pokedexCover.frame.size.height);
        self.openTextLabel.hidden = YES;
    } completion:^(BOOL complete) {
      self.pokedexCover.hidden = YES;
      if(self.selected) {
        self.openTextLabel.text = [NSString stringWithFormat:@"height: %i   weight: %i", self.selected.height, self.selected.weight];
        self.openTextLabel.hidden = NO;
      }
    }];
}

- (void)closePokedex {
  NSLog(@"close pokedex called");
    self.pokedexCover.frame = CGRectMake(self.view.frame.size.width, self.pokedexCover.frame.origin.y, 0, self.pokedexCover.frame.size.height);
    self.pokedexCover.hidden = NO;
    [UIView animateWithDuration:0.2 animations:^{
        self.pokedexCover.frame = CGRectMake(0, self.pokedexCover.frame.origin.y, self.view.frame.size.width, self.pokedexCover.frame.size.height);
        self.openTextLabel.hidden = NO;
        self.openTextLabel.text = @"Swipe right to open the Pokedex";
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
    
    Pokemon *tmpPoke = (Pokemon *)[[AppDelegate getList] objectAtIndex:[indexPath row] + 1];
    cell.textLabel.text = tmpPoke.name;
    
    NSLog(@"grabbin name %@", tmpPoke.name);
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Pokemon *tmp = (Pokemon*)[[AppDelegate getList] objectAtIndex:[indexPath row] + 1];
    if(tmp.img == nil) {
        NSLog(@"fetching image");
        // get photo and cache
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        [manager GET:[NSString stringWithFormat:@"%@media/img/%i.png", BASE_URL, tmp.number]
          parameters:nil
             success:^(AFHTTPRequestOperation *operation, id responseObject) {
                 tmp.img = [UIImage imageWithData:(NSData *)responseObject];
                 pokeView.image = tmp.img;
               self.openTextLabel.text = [NSString stringWithFormat:@"height: %i   weight: %i", tmp.height, tmp.weight];
               self.openTextLabel.hidden = NO;
             } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                 NSLog(@"Error: %@", error);
                 // TODO - display a "not available" image
             }
         ];
    } else {
        NSLog(@"using cached image");
        pokeView.image = tmp.img;
        self.openTextLabel.text = [NSString stringWithFormat:@"height: %i   weight: %i", tmp.height, tmp.weight];
        self.openTextLabel.hidden = NO;
    }
  self.selected = tmp;
}

@end
