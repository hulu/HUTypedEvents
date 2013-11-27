//
//  HUExampleMainViewController.h
//  HUTypedEventsExample
//
//  Created by Bao Lei on 11/25/13.
//  Copyright (c) 2013 Hulu, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HUEventHandler.h"

@interface HUExampleMainViewController : UIViewController <EventButtonTapped> {
    UILabel* label_;
    UIButton* openModalButton_;
    
    int* counter_;
}

@end
