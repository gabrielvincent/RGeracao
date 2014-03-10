//
//  LectureViewController.h
//  RGeracao
//
//  Created by Gabriel Vincent on 09/03/14.
//  Copyright (c) 2014 Gabriel Vincent. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LectureViewController : UIViewController {
    
    IBOutlet UILabel *nameLabel;
    IBOutlet UILabel *timeLabel;
}

@property (nonatomic, weak) NSString *name;
@property (nonatomic, weak) NSString *time;

- (IBAction)addLectureToFavourites:(id)sender;

@end
