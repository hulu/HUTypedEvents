//
//  HUEventHandler.h
//  HUTypedEventsExample
//
//  Created by Bao Lei on 11/25/13.
//  Copyright (c) 2013 Hulu, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HUTypedEvents.h"


HUDeclareEvent(EventButtonTapped, buttonID:(int)buttonID)


@interface HUEventHandler : NSObject

HUDeclareSingleton(HUEventHandler)

HUDeclareEventRegistration(EventButtonTapped, buttonID:(int)buttonID)


@end
