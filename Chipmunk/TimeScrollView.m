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
@property (nonatomic) BOOL isStopped;
@property (nonatomic) TimeScrollDirection currentDir;

@end

@implementation TimeScrollView

@synthesize currentDir = _currentDir;
@synthesize isStopped = _isStopped;

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
    self.isStopped = YES;
    self.contentSize = CGSizeMake((MinuteMultiplyFactor * MinutesInDay) + self.frame.size.width, self.contentSize.height);
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    int scrollLocation = self.contentOffset.x;
    self.currentDir = (self.lastLocation < scrollLocation) ? TimeScrollRight : TimeScrollLeft;
    if(self.isStopped) {
        [self.timeDelegate didBeginScrolling:self.currentDir];
        self.isStopped = NO;
    }
    self.lastLocation = scrollLocation;
    int totalMins = scrollLocation/MinuteMultiplyFactor;
    int hours = totalMins/60;
    int minutes = totalMins - (hours * 60);
    //NSLog(@"Minute: %i Hour: %i", minutes, hours);
    
    [self.timeDelegate scrolledToHour:hours Minute:minutes];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    self.isStopped = YES;
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    self.isStopped = !decelerate;
}

- (void)setIsStopped:(BOOL)isStopped {
    if(isStopped) {
        [self.timeDelegate didStopScrolling];
    }
    _isStopped = isStopped;
}



@end

