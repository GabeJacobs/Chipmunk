//
//  DatabaseManager.m
//  Chipmunk
//
//  Created by Amadou Crookes on 2/24/13.
//  Copyright (c) 2013 Gabe Jacobs. All rights reserved.
//

#import "DatabaseManager.h"
#import "FSNConnection.h"


@interface DatabaseManager ()

@end

@implementation DatabaseManager

// start a connection and return the data to the delegate
- (void)getActivities:(unsigned int)time currentLocation:(CLLocation*)geo
{
    FSNConnection* connection = [FSNConnection withUrl:[NSURL URLWithString:@"http://chipmunk.io/api/items/query"] method:FSNRequestMethodGET headers:[NSDictionary dictionary] parameters:[NSDictionary dictionaryWithObjectsAndKeys:@"10",@"time",@"-79.32,103.81",@"geo", nil]
                                            parseBlock:^id(FSNConnection *c, NSError *__autoreleasing *error) {
        return [c.responseData dictionaryFromJSONWithError:error];
    } completionBlock:^(FSNConnection *c) {
        NSError* error;
        NSArray* response = [NSJSONSerialization JSONObjectWithData:c.responseData options:0 error:&error];
        [self.delegate recievedActivities:response];
    } progressBlock:^(FSNConnection *c) {
        
    }];
    
    [connection start];
}


@end
