//
//  ViewController.h
//  Chipmunk
//
//  Created by Gabe Jacobs on 2/21/13.
//  Copyright (c) 2013 Gabe Jacobs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *minuteLabel;
@property (weak, nonatomic) IBOutlet UILabel *hourLabel;
@property (weak, nonatomic) IBOutlet UIButton *chipmunkGo;


- (IBAction)minusHour:(id)sender;
- (IBAction)plusHour:(id)sender;
- (IBAction)minusMin:(id)sender;
- (IBAction)plusMin:(id)sender;

@end
