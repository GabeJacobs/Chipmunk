//
//  TimeScrollView.m
//  Wheel
//
//  Created by Amadou Crookes on 2/23/13.
//  Copyright (c) 2013 Amadou Crookes. All rights reserved.
//

#import "TimeScrollView.h"

const int MinuteMultiplyFactor = 15;

const int MinutesInDay = 1440;

@interface TimeScrollView ()

@property (nonatomic) CGFloat lastLocation;
@property (nonatomic) TimeScrollDirection currentDir;

@end

@implementation TimeScrollView

@synthesize currentDir = _currentDir;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.delegate = self;
    }
    return self;
}

- (void)setupTimeScroll {
    // 320 is the width of the screen so that the scroll view goes from 0 to 7200
    self.delegate = self;
    self.currentDir = TimeScrollLeft;
    self.lastLocation = 0;
    self.contentSize = CGSizeMake((MinuteMultiplyFactor * MinutesInDay) + self.frame.size.width, self.contentSize.height);
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    int scrollLocation = self.contentOffset.x;
    self.currentDir = (self.lastLocation < scrollLocation) ? TimeScrollRight : TimeScrollLeft;
    int totalMins = scrollLocation/MinuteMultiplyFactor;
    int hours = totalMins/60;
    int minutes = totalMins - (hours * 60);
    //NSLog(@"Minute: %i Hour: %i", minutes, hours);
    
    [self.timeDelegate scrolledToHour:hours Minute:minutes];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self.timeDelegate didStopScrolling];
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    
}

- (void)setCurrentDir:(TimeScrollDirection)currentDir {
   
    if(currentDir != _currentDir) {
        NSLog(@"should begin scrolling: %i", currentDir);
        [self.timeDelegate didBeginScrolling:currentDir];
    }
    _currentDir = currentDir;
}



@end

