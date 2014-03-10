//
//  LecturesListViewController.m
//  RGeracao
//
//  Created by Gabriel Vincent on 09/03/14.
//  Copyright (c) 2014 Gabriel Vincent. All rights reserved.
//

#import "LecturesListViewController.h"
#import "LectureViewController.h"

@implementation LecturesListViewController

#pragma mark - Setup

- (void)setData {
    
    self.searchDisplayController.searchResultsDelegate = self;
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"lectures" ofType:@"json"];
    NSData *lecturesJSONData = [[NSData alloc] initWithContentsOfFile:filePath];
    
    lectures = [[NSArray alloc] init];
    lectures = [NSJSONSerialization JSONObjectWithData:lecturesJSONData options:NSJSONReadingAllowFragments error:nil];
}

#pragma mark - UIViewControllerLifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setData];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if (self.tableView.indexPathForSelectedRow)
        [self.tableView deselectRowAtIndexPath:self.tableView.indexPathForSelectedRow animated:YES];
        
}

#pragma mark - Implementation

- (NSArray *)dataSourceForTableView:(UITableView *)tableView {
    
    if (IsSearching)
        return searchResults;
    
    return lectures;
}

#pragma mark - Search methods

- (void) searchDisplayControllerDidEndSearch:(UISearchDisplayController *)controller
{
    searchResults = nil;
}

- (void) searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    
    NSMutableArray *temporarySearchArray = [[NSMutableArray alloc] init];
    NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"name contains[cd] %@", searchText]; /* OR time contains[cd] %@ */
    
    for (NSDictionary *lecture in [lectures filteredArrayUsingPredicate:resultPredicate])
        [temporarySearchArray addObject:lecture];
    
    searchResults = temporarySearchArray.copy;
}

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    return YES;
}

#pragma mark - Table view data source

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self dataSourceForTableView:tableView].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    
    NSDictionary *lecture = [self dataSourceForTableView:tableView][indexPath.row];
    
    cell.textLabel.text = lecture[@"name"];
    
    return cell;
}


#pragma mark - Table view delegate

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    LectureViewController *lectureViewController = segue.destinationViewController;
    
    NSDictionary *lecture = lectures[self.tableView.indexPathForSelectedRow.row];
    
    lectureViewController.name = lecture[@"name"];
    lectureViewController.time = lecture[@"time"];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"PushToLectureViewController" sender:self];
}

@end
