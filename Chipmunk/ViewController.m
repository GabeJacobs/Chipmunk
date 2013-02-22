//
//  ViewController.m
//  Chipmunk
//
//  Created by Gabe Jacobs on 2/21/13.
//  Copyright (c) 2013 Gabe Jacobs. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    int mins = 0;
    int hours = 0;
    
    self.minuteLabel.text = [NSString stringWithFormat:@"%d", mins];
    self.hourLabel.text = [NSString stringWithFormat:@"%d", hours];

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoNsryWarning];
    // Dispose of any resources that can be recreated.
}

     - (IBAction)minusHour:(id)sender {
     }
     - (IBAction)plusHour:(id)sender {
     }
     - (IBAction)minusMin:(id)sender {
     }
     - (IBAction)plusMin:(id)sender {
     }
@end
