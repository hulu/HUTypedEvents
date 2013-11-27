//
//  HUExampleMainViewController.m
//  HUTypedEventsExample
//
//  Created by Bao Lei on 11/25/13.
//  Copyright (c) 2013 Hulu, LLC. All rights reserved.
//

#import "HUExampleMainViewController.h"
#import "HUModalViewController.h"

@implementation HUExampleMainViewController

- (id)init
{
    self = [super init];
    if (self) {
        counter_ = malloc(sizeof(int) * 3);
        for (int i = 0; i < 3; i ++) {
            counter_[i] = 0;
        }
        [[HUEventHandler instance] registerEventButtonTapped_observer:self];
    }
    return self;
}

- (void)loadView
{
    [super loadView];
    
    label_ = [UILabel new];
    label_.text = @"Tap the button below to start";
    label_.textAlignment = NSTextAlignmentCenter;
    
    openModalButton_ = [UIButton buttonWithType:UIButtonTypeSystem];
    [openModalButton_ setTitle:@"Open Modal View" forState:UIControlStateNormal];
    [openModalButton_ addTarget:self action:@selector(openModal:) forControlEvents:UIControlEventTouchUpInside];
    
    UIView* superview = self.view;
    // --- VFL GENERATED CODE ---
    /*
     center[label_(300)]
     center[openModalButton_(200)]
     V:|-100-[label_(50)]-50-[openModalButton_(44)]
     */
    {
        // You need to predefine superview before this.

        CGRect frame;

        frame = openModalButton_.frame;
        frame.size.width = 200;
        frame.origin.x = (superview.bounds.size.width - frame.size.width) / 2.0;
        frame.origin.y = 0 + 100 + 50 + 50;
        frame.size.height = 44;
        openModalButton_.frame = frame;
        openModalButton_.autoresizingMask |= UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        openModalButton_.autoresizingMask |= UIViewAutoresizingFlexibleBottomMargin;
        [superview addSubview:openModalButton_];

        frame = label_.frame;
        frame.size.width = 300;
        frame.origin.x = (superview.bounds.size.width - frame.size.width) / 2.0;
        frame.origin.y = 0 + 100;
        frame.size.height = 50;
        label_.frame = frame;
        label_.autoresizingMask |= UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        label_.autoresizingMask |= UIViewAutoresizingFlexibleBottomMargin;
        [superview addSubview:label_];

    }
    // --- END OF CODE GENERATED FROM VFL ---
}

- (void)openModal:(id)sender {
    [self presentViewController:[HUModalViewController new] animated:YES completion:nil];
}

#pragma mark - Event Handling

- (void)handleEventButtonTapped_buttonID:(int)buttonID {
    if (buttonID >=0 && buttonID < 3) {
        counter_[buttonID] ++;
    }
    NSMutableString* string = [NSMutableString new];
    for (int i = 0; i < 3; i ++) {
        [string appendFormat:@"%d", counter_[i]];
        if (i < 2) {
            [string appendFormat:@" , "];
        }
    }
    label_.text = string;
}

@end
