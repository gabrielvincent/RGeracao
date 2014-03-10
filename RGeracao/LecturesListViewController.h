//
//  LecturesListViewController.h
//  RGeracao
//
//  Created by Gabriel Vincent on 09/03/14.
//  Copyright (c) 2014 Gabriel Vincent. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LecturesListViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
    
    NSArray *lectures;
}

@property (nonatomic, strong) IBOutlet UITableView *tableView;

@end
