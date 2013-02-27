//
//  ViewController.m
//  Chipmunk
//
//  Created by Gabe Jacobs on 2/21/13.
//  Copyright (c) 2013 Gabe Jacobs. All rights reserved.
//

#import "ViewController.h"
#import "ChipmunkUtils.h"
#import "ActivityTableViewController.h"
#import <QuartzCore/QuartzCore.h>

#define RADIANS_TO_DEGREES(__ANGLE__) ((__ANGLE__) / (float)M_PI * 180.0f)

@interface ViewController ()

@property float currentAngle;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    /*
    NSLog(@"tt0001m_: %@",
          [UIFont fontNamesForFamilyName:@"Proxima Nova"]
          );
    UIFont *proximaReg = [UIFont
            fontWithName:@"Proxima Nova"
                          size:20];
    [self.hourLabel setFont:proximaReg];
    [self.minLabel setFont:[UIFont fontWithName:@"Proxima Nova Regular" size:20.0]];
    [self.mLabel setFont:[UIFont fontWithName:@"Proxima Nova Regular" size:20.0]];
    [self.hLabel setFont:[UIFont fontWithName:@"Proxima Nova Regular" size:20.0]];
    */
    self.view.backgroundColor = [ChipmunkUtils chipmunkColor];
    [self scrolledToHour:0 Minute:0];
    [self.timeScrollView setupTimeScroll];
    self.timeScrollView.timeDelegate = self;
    self.rotatingTimeSelect.delegate = self;
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)didStopScrolling{
    
    CALayer *currentLayer = (CALayer *)[self.circleImage.layer presentationLayer];
    self.currentAngle = [(NSNumber *)[currentLayer valueForKeyPath:@"transform.rotation"] floatValue];

    CGAffineTransform rot = CGAffineTransformMakeRotation(self.currentAngle);
    self.circleImage.transform = rot;
    
    [self.circleImage.layer removeAllAnimations];
    
    
}

- (void)didBeginScrolling:(int)direction{
    CALayer *currentLayer = (CALayer *)[self.circleImage.layer presentationLayer];
    self.currentAngle = [(NSNumber *)[currentLayer valueForKeyPath:@"transform.rotation"] floatValue];
    
    CGAffineTransform rot = CGAffineTransformMakeRotation(self.currentAngle);
    self.circleImage.transform = rot;
    if(direction == 1)
    {
        
        CABasicAnimation *fullRotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
        fullRotation.fillMode = kCAFillModeForwards;
        fullRotation.fromValue = [NSNumber numberWithFloat:self.currentAngle];
        fullRotation.toValue = [NSNumber numberWithFloat:((360*M_PI)/180+self.currentAngle)];
        fullRotation.duration = 1.5;
        fullRotation.repeatCount = 10000;
        [self.circleImage.layer addAnimation:fullRotation forKey:@"360"];
        
    }
    if(direction == 0){
        CABasicAnimation *fullRotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
        fullRotation.fillMode = kCAFillModeForwards;
        fullRotation.fromValue = [NSNumber numberWithFloat:((360*M_PI)/180+self.currentAngle)];
        fullRotation.toValue = [NSNumber numberWithFloat:self.currentAngle];
        fullRotation.duration = 1.5;
        fullRotation.repeatCount = 10000;
        [self.circleImage.layer addAnimation:fullRotation forKey:@"360"];
        
    }
  
}

- (void)scrolledToHour:(int)hour Minute:(int)minute
{    
    self.hourLabel.text = [NSString stringWithFormat:@"%d",hour];
    self.minLabel.text = [NSString stringWithFormat:@"%d",minute];
}

- (void)rotatedToHour:(int)hour Minute:(int)minute
{
    self.hourLabel.text = [NSString stringWithFormat:@"%d",hour];
    self.minLabel.text = [NSString stringWithFormat:@"%d",minute];
}


- (unsigned int)getTotalMinutes
{
    int hours = [self.hourLabel.text intValue];
    int minutes = [self.minLabel.text intValue];
    return (hours * 60) + minutes;
}

- (IBAction)getActivitiesTable:(id)sender
{
    unsigned int minutes = [self getTotalMinutes];
    if(minutes > 0) {
        ActivityTableViewController* atvc = [self.storyboard instantiateViewControllerWithIdentifier:@"activityTable"];
        atvc.minutes = minutes;
        [self.navigationController pushViewController:atvc animated:YES];
    } else {
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"No Time?" message:@"Please add time by spinning the circle" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
}









@end

