//
//  HUEventHandler.m
//  HUTypedEventsExample
//
//  Created by Bao Lei on 11/25/13.
//  Copyright (c) 2013 Hulu, LLC. All rights reserved.
//

#import "HUEventHandler.h"

@implementation HUEventHandler

HUImplementSingleton(HUEventHandler)

HUImplementEvent (EventButtonTapped, buttonID:(int)buttonID)

@end
