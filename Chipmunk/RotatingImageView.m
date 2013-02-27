//
//  RotatingImageView.m
//  Chipmunk
//
//  Created by Amadou Crookes on 2/26/13.
//  Copyright (c) 2013 Gabe Jacobs. All rights reserved.
//

#import "RotatingImageView.h"
#import <QuartzCore/QuartzCore.h>


#define degreesToRadians(degrees) (M_PI * degrees / 180.0)
#define radiansToDegrees(radians) (radians * 180 / M_PI)


const int MINUTES_IN_FULL_ROTATION = 45;


@interface RotatingImageView ()

@property (nonatomic) CGPoint beganTouchLocation;
@property (nonatomic) float deltaAngle;
@property (nonatomic) CGAffineTransform startTransform;
@property (nonatomic) int fullRotations;

@end


@implementation RotatingImageView

@synthesize beganTouchLocation = _beganTouchLocation;
@synthesize deltaAngle = _deltaAngle;
@synthesize fullRotations = _fullRotations;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

//*********************************************************
//*********************************************************
#pragma mark - Touch Events
//*********************************************************
//*********************************************************


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch* touch = [touches anyObject];
    CGPoint  touchCoor = [touch locationInView:self];

    
    float dx = touchCoor.x - self.center.x;
    float dy = touchCoor.y - self.center.y;
    self.deltaAngle = atan2(dy, dx);
    self.startTransform = self.transform;
}


- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    //self.transform = CGAffineTransformMakeScale(1.05, 1.05);
    
    UITouch* touch = [touches anyObject];
    
    CGPoint pt = [touch locationInView:self];
    
    CALayer *currentLayer = [self.layer presentationLayer];
    float currentAngle = [[currentLayer valueForKeyPath:@"transform.rotation"] floatValue];
    NSLog(@"Current angle: %f", currentAngle);
    
    if([self calculateDistanceFromCenter:pt] < 50) {
        NSLog(@"TOO CLOSE HOMIE. GET OUTA DERRRR");
        return;
    }
 
    float dx = pt.x  - self.center.x;
    float dy = pt.y  - self.center.y;
    float ang = atan2(dy,dx);
    float angleDifference = self.deltaAngle - ang;
    

    float newAngle = currentAngle - angleDifference;
    if(newAngle < 0 && [self totalMinutes] == 0) {
        [self timeBasedOnRotations];
        NSLog(@"you dumb piece of shit!\nYou do not have negative time you idiot. LOLZ");
        return;
    }
    
    [self timeBasedOnRotations];
    if( (currentAngle < 0 && currentAngle > -1) && newAngle > 0) {
        self.fullRotations++;
    } else if( (currentAngle > 0 && currentAngle < 1) && newAngle < 0) {
        self.fullRotations--;
    }
    
    self.transform = CGAffineTransformMakeRotation(newAngle);

}

//*********************************************************
//*********************************************************
#pragma mark - Calculations
//*********************************************************
//*********************************************************

- (float) calculateDistanceFromCenter:(CGPoint)point {
    CGPoint center = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
    float dx = point.x - center.x;
    float dy = point.y - center.y;
    return sqrt(dx*dx + dy*dy);
}

- (void)timeBasedOnRotations {
    unsigned int totalMins = [self totalMinutes];
    [self.delegate rotatedToHour:totalMins/60 Minute:totalMins - ((totalMins/60)*60)];
}

- (unsigned int)totalMinutes {
    CALayer *currentLayer = [self.layer presentationLayer];
    float currentAngle = [[currentLayer valueForKeyPath:@"transform.rotation"] floatValue];
    float degrees = radiansToDegrees(currentAngle);
    if(degrees < 0) {
        //NSLog(@"Degrees: %f Converted: %f", degrees, 360 + degrees);
        degrees = 360 + degrees;
    }
    unsigned int totalMins;
    if(self.fullRotations < 0) {
        totalMins = 0;
    } else {
        totalMins = self.fullRotations * MINUTES_IN_FULL_ROTATION;
        totalMins += (degrees/360) * MINUTES_IN_FULL_ROTATION;
    }
    return totalMins;
}


//*********************************************************
//*********************************************************
#pragma mark - Setters & Getters
//*********************************************************
//*********************************************************

- (void)setFullRotations:(int)fullRotations {
    _fullRotations = (fullRotations < -1) ? -1 : fullRotations;
}


@end
