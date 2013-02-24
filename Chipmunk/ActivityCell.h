//
//  ActivityCell.h
//  Chipmunk
//
//  Created by Gabe Jacobs on 2/24/13.
//  Copyright (c) 2013 Gabe Jacobs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ActivityCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *activityName;
@property (weak, nonatomic) IBOutlet UIImageView *activityImage;
@property (weak, nonatomic) IBOutlet UILabel *activityTime;
@property (weak, nonatomic) IBOutlet UIImageView *activityTypeIcon;
@property (weak, nonatomic) IBOutlet UIImageView *topBar;

@end
