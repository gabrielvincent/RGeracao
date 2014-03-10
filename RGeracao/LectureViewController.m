//
//  LectureViewController.m
//  RGeracao
//
//  Created by Gabriel Vincent on 09/03/14.
//  Copyright (c) 2014 Gabriel Vincent. All rights reserved.
//

#import "LectureViewController.h"

@implementation LectureViewController

#pragma mark - Setup

- (void)setData {
    
    nameLabel.text = self.name;
    timeLabel.text = self.time;
}

#pragma mark - UIViewController lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setData];
}

#pragma mark - Implementation

- (IBAction)addLectureToFavourites:(id)sender {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Adicionado" message:@"Ou não" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}

@end
