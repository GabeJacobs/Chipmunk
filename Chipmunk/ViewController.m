//
//  ViewController.m
//  Chipmunk
//
//  Created by Gabe Jacobs on 2/21/13.
//  Copyright (c) 2013 Gabe Jacobs. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

#define RADIANS_TO_DEGREES(__ANGLE__) ((__ANGLE__) / (float)M_PI * 180.0f)

@interface ViewController ()

@property float currentAngle;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
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
    NSLog(@"current angle: %f",self.currentAngle);
  
    

    CGAffineTransform rot = CGAffineTransformMakeRotation(self.currentAngle);
    self.circleImage.transform = rot;
    self.circleImage.center = CGPointMake(165, 166);
    
    
    
    [self.circleImage.layer removeAllAnimations];
    
    
}

- (void)didBeginScrolling:(int)direction{
    
    if(direction == 1)
    {
        
        CABasicAnimation *fullRotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
        fullRotation.fillMode = kCAFillModeForwards;
        fullRotation.fromValue = [NSNumber numberWithFloat:0];
        fullRotation.toValue = [NSNumber numberWithFloat:((360*M_PI)/180)];
        fullRotation.duration = 1;
        fullRotation.repeatCount = 10000;
        [self.circleImage.layer addAnimation:fullRotation forKey:@"360"];
        
    }
    if(direction == 0){
        CABasicAnimation *fullRotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
        fullRotation.fillMode = kCAFillModeForwards;
        fullRotation.fromValue = [NSNumber numberWithFloat:((360*M_PI)/180)];
        fullRotation.toValue = [NSNumber numberWithFloat:0];
        fullRotation.duration = 1;
        fullRotation.repeatCount = 10000;
        [self.circleImage.layer addAnimation:fullRotation forKey:@"360"];
        
    }
  
}

- (void)scrolledToHour:(int)hour Minute:(int)minute{
    
    self.hourLabel.text = [NSString stringWithFormat:@"%d",hour];
    self.minLabel.text = [NSString stringWithFormat:@"%d",minute];

}

- (IBAction)stop:(id)sender {
    
    [self didStopScrolling];
}

- (IBAction)go:(id)sender {
    
    [self didBeginScrolling:1];
}
@end

