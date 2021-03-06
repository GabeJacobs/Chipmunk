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
#import <QuartzCore/QuartzCore.h>

@interface ActivityTableViewController () <DatabaseManagerDelegate>

@property (nonatomic, strong) DatabaseManager* dbManager;

@end

@implementation ActivityTableViewController

@synthesize dataSource = _dataSource;
@synthesize minutes;

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
    NSLog(@"minutes: %i", self.minutes);
    [self.dbManager getActivities:self.minutes currentLocation:nil];
    
    

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
        
    }
    /*
    cell.bottomBar.backgroundColor = [UIColor clearColor];
    cell.bottomBar.layer.shadowColor = [[UIColor blackColor] CGColor];
    cell.bottomBar.layer.shadowOffset = CGSizeMake(10.0f,10.0f);
    cell.bottomBar.layer.shadowOpacity = .5f;
    cell.bottomBar.layer.shadowRadius = 10.0f;
     */
    
    
    NSDictionary* data = self.dataSource[indexPath.row];
    cell.activityName.text = data[@"name"];
    NSString *type = data[@"details_type"];
    if([type isEqualToString:@"Link"])
    {
        cell.activityTypeIcon.image = [UIImage imageNamed:@"book.png"];
    }
    else if([type isEqualToString:@"Venue"])
    {
        cell.activityTypeIcon.image = [UIImage imageNamed:@"venue.png"];
    }
    else if([type isEqualToString:@"Video"])
    {
        cell.activityTypeIcon.image = [UIImage imageNamed:@"video.png"];
    }
    unsigned int totalMinutes = [data[@"minutes"] intValue];
    NSString* time = nil;
    if(totalMinutes < 60) {
        time = [NSString stringWithFormat:@"%@m", data[@"minutes"]];
    } else {
        int hours = totalMinutes/60;
        int mins = totalMinutes - 60 * (totalMinutes/60);
        time = [NSString stringWithFormat:@"%ih", hours];
        if(mins != 0) {
            time = [time stringByAppendingString:[NSString stringWithFormat:@" %im", mins]];
        }
    }
    cell.activityTime.text = time;
    NSString *activityURL = data[@"img_url"];
    UIImage *image;
    cell.activityImage.image = image;
    NSLog(@"activity url: %@", activityURL.class);
    if(![activityURL isKindOfClass:[NSNull class]] && !([activityURL isEqualToString:@""]))
    {
        image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:activityURL]]];
    } else {
        image = [UIImage imageNamed:@"leopard.jpeg"];
    }
    cell.activityImage.image = image;

    
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

- (IBAction)popView:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}


@end
