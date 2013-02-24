//
//  DatabaseManager.h
//  Chipmunk
//
//  Created by Amadou Crookes on 2/24/13.
//  Copyright (c) 2013 Gabe Jacobs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@protocol DatabaseManagerDelegate <NSObject>

- (void)recievedActivities:(NSArray*)activities;

@end

@interface DatabaseManager : NSObject

@property (nonatomic,strong) id <DatabaseManagerDelegate> delegate;

// the activities are passed back through a delegate call
- (void)getActivities:(unsigned int)time currentLocation:(CLLocation*)geo;

@end
