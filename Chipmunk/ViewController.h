//
//  ViewController.h
//  Chipmunk
//
//  Created by Gabe Jacobs on 2/21/13.
//  Copyright (c) 2013 Gabe Jacobs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TimeScrollView.h"
#import "RotatingImageView.h"
#import "DatabaseManager.h"
#include <AudioToolbox/AudioToolbox.h>

@interface ViewController : UIViewController <TimeScrollViewDelegate, RotatingImageDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *circleImage;
@property (weak, nonatomic) IBOutlet UILabel *hourLabel;
@property (weak, nonatomic) IBOutlet UILabel *minLabel;
@property (weak, nonatomic) IBOutlet TimeScrollView *timeScrollView;
@property (weak, nonatomic) IBOutlet RotatingImageView *rotatingTimeSelect;
@property (weak, nonatomic) IBOutlet UILabel *hourSymbol;
@property (weak, nonatomic) IBOutlet UILabel *minuteSymbol;
@property (nonatomic) int hourIsShowing;

// for ticking sound
@property (nonatomic) CFURLRef tickURLRef;
@property (nonatomic) SystemSoundID	tickObject;

//- (IBAction)launchActiviesView:(id)sender;


@end
