//
//  ActivityTableViewController.m
//  Chipmunk
//
//  Created by Gabe Jacobs on 2/24/13.
//  Copyright (c) 2013 Gabe Jacobs. All rights reserved.
//

#import "ActivityTableViewController.h"
#import "ActivityCell.h"

@interface ActivityTableViewController ()

@end

@implementation ActivityTableViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//*************************************************************
//*************************************************************
#pragma mark - Table Delegate/Datasource
//*************************************************************
//*************************************************************

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;//[self.dataSource count];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ActivityCell* cell = [self.table dequeueReusableCellWithIdentifier:@"activityCell"];
    if(cell == nil) {
        cell = [[ActivityCell alloc]  init];
        // if all cells have a common property set that here
    }
    // the information you need is in
    //self.dataSource[indexPath.row];
    
    // the things that are different for each cell such as time and the icon
    // set that here?!?!?!?!?!
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"a cell was selected, DO SOMETHING YOU PIECE OF SHIT!!!!!!!");
}











@end
