//
//  ViewController.m
//  Chipmunk
//
//  Created by Gabe Jacobs on 2/21/13.
//  Copyright (c) 2013 Gabe Jacobs. All rights reserved.
//

#import "ViewController.h"
#import "ChipmunkUtils.h"
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

- (void)scrolledToHour:(int)hour Minute:(int)minute{
    
    self.hourLabel.text = [NSString stringWithFormat:@"%d",hour];
    self.minLabel.text = [NSString stringWithFormat:@"%d",minute];

}


- (IBAction)launchActiviesView:(id)sender {
    
    
}
@end

