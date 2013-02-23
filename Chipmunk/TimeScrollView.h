//
//  TimeScrollView.h
//  Wheel
//
//  Created by Amadou Crookes on 2/23/13.
//  Copyright (c) 2013 Amadou Crookes. All rights reserved.
//

#import <UIKit/UIKit.h>

enum TimeScrollDirection {
    TimeScrollLeft = 0,
    TimeScrollRight = 1
    };

@protocol TimeScrollViewDelegate <NSObject>

- (void)didStopScrolling;
- (void)didBeginScrolling:(int)direction;
- (void)scrolledToHour:(int)hour Minute:(int)minute;

@end

@interface TimeScrollView : UIScrollView <UIScrollViewDelegate>

@property (nonatomic,strong) id <TimeScrollViewDelegate> timeDelegate;

- (void)setupTimeScroll;

@end
