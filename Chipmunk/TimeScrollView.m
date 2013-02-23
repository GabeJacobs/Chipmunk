//
//  TimeScrollView.m
//  Wheel
//
//  Created by Amadou Crookes on 2/23/13.
//  Copyright (c) 2013 Amadou Crookes. All rights reserved.
//

#import "TimeScrollView.h"

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


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"SCROLLING: %f", self.contentOffset.x);
}

- (int)getMinutes {
    
}

- (int)getHours {
    
}


- (int)getCurrentTime {
    
}


@end
