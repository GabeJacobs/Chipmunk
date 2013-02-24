//
//  ActivityTableViewController.h
//  Chipmunk
//
//  Created by Gabe Jacobs on 2/24/13.
//  Copyright (c) 2013 Gabe Jacobs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ActivityTableViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *table;
@property (nonatomic, strong) NSArray* dataSource;
@property (nonatomic) unsigned int minutes;

@end
