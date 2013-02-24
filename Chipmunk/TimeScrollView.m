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



@end

@implementation TimeScrollView

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
    self.contentSize = CGSizeMake((MinuteMultiplyFactor * MinutesInDay) + self.frame.size.width, self.contentSize.height);
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    int totalMins = self.contentOffset.x/MinuteMultiplyFactor;
    int hours = totalMins/60;
    int minutes = totalMins - (hours * 60);
    NSLog(@"Minute: %i Hour: %i", minutes, hours);
    
    [self.timeDelegate scrolledToHour:hours Minute:minutes];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self.timeDelegate didStopScrolling];
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    
}



@end

