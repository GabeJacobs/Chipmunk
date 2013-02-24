//
//  ViewController.h
//  Chipmunk
//
//  Created by Gabe Jacobs on 2/21/13.
//  Copyright (c) 2013 Gabe Jacobs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TimeScrollView.h"
#import "DatabaseManager.h"

@interface ViewController : UIViewController <TimeScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *circleImage;
@property (weak, nonatomic) IBOutlet UILabel *hourLabel;
@property (weak, nonatomic) IBOutlet UILabel *minLabel;
@property (weak, nonatomic) IBOutlet TimeScrollView *timeScrollView;
- (IBAction)launchActiviesView:(id)sender;


@end
