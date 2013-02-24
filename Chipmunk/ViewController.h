//
//  ViewController.h
//  Chipmunk
//
//  Created by Gabe Jacobs on 2/21/13.
//  Copyright (c) 2013 Gabe Jacobs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TimeScrollView.h"

@interface ViewController : UIViewController <TimeScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *circleImage;
@property (weak, nonatomic) IBOutlet UILabel *hourLable;
@property (weak, nonatomic) IBOutlet UILabel *minLable;

- (IBAction)stop:(id)sender;
- (IBAction)go:(id)sender;



@end
