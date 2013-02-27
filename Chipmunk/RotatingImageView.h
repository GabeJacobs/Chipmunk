//
//  RotatingImageView.h
//  Chipmunk
//
//  Created by Amadou Crookes on 2/26/13.
//  Copyright (c) 2013 Gabe Jacobs. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RotatingImageDelegate <NSObject>

- (void)rotatedToHour:(int)hour Minute:(int)minute;

@end

@interface RotatingImageView : UIImageView

@property (nonatomic,strong) id <RotatingImageDelegate> delegate;

@end
