//
//  LecturesListViewController.h
//  RGeracao
//
//  Created by Gabriel Vincent on 09/03/14.
//  Copyright (c) 2014 Gabriel Vincent. All rights reserved.
//

#define IsSearching [tableView isEqual:self.searchDisplayController.searchResultsTableView]

#import <UIKit/UIKit.h>

@interface LecturesListViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, UISearchDisplayDelegate> {
    
    NSArray *lectures;
    NSArray *searchResults;
}

@property (nonatomic, strong) IBOutlet UITableView *tableView;

@end
