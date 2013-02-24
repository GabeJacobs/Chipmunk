//
//  ActivityTableViewController.m
//  Chipmunk
//
//  Created by Gabe Jacobs on 2/24/13.
//  Copyright (c) 2013 Gabe Jacobs. All rights reserved.
//

#import "ActivityTableViewController.h"
#import "ChipmunkUtils.h"
#import "ActivityCell.h"
#import "DatabaseManager.h"

@interface ActivityTableViewController () <DatabaseManagerDelegate>

@property (nonatomic, strong) DatabaseManager* dbManager;

@end

@implementation ActivityTableViewController

@synthesize dataSource = _dataSource;

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
    NSLog(@"activity table view controller did load");
    self.table.backgroundColor = [ChipmunkUtils tableColor];
    self.view.backgroundColor = [ChipmunkUtils tableColor];

    self.dbManager.delegate = self;
    [self.dbManager getActivities:30 currentLocation:nil];
    
    

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
    return [self.dataSource count];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ActivityCell* cell = [self.table dequeueReusableCellWithIdentifier:@"activityCell"];
    if(cell == nil) {
        cell = [[ActivityCell alloc]  init];
        // if all cells have a common property set that here
        cell.backgroundColor = [UIColor clearColor];
    }
    
    NSDictionary* data = self.dataSource[indexPath.row];
    cell.activityName.text = data[@"name"];
    cell.activityTime.text = [NSString stringWithFormat:@"%@m", data[@"minutes"]];
    
    // the things that are different for each cell such as time and the icon
    // set that here?!?!?!?!?!
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"a cell was selected, DO SOMETHING YOU PIECE OF SHIT!!!!!!!");
}


//*************************************************************
//*************************************************************
#pragma mark - Connection stuff
//*************************************************************
//*************************************************************

- (void)recievedActivities:(NSArray *)activities
{
    NSMutableArray* allActivities = [NSMutableArray arrayWithArray:self.dataSource];
    [allActivities addObjectsFromArray:activities];
    self.dataSource = [NSArray arrayWithArray:allActivities];
    NSLog(@"activities: %@", self.dataSource);
}



//*************************************************************
//*************************************************************
#pragma mark - Getters/Setters
//*************************************************************
//*************************************************************

- (void)setDataSource:(NSArray *)dataSource
{
    _dataSource = dataSource;
    [self.table reloadData];
}

- (DatabaseManager*)dbManager
{
    if(!_dbManager) {
        _dbManager = [[DatabaseManager alloc] init];
    }
    return _dbManager;
}



@end
