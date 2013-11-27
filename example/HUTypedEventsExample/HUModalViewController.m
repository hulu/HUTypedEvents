//
//  HUModalViewController.m
//  HUTypedEventsExample
//
//  Created by Bao Lei on 11/25/13.
//  Copyright (c) 2013 Hulu, LLC. All rights reserved.
//

#import "HUModalViewController.h"
#import "HUEventHandler.h"

@implementation HUModalViewController


- (void)loadView
{
    [super loadView];
    self.view.backgroundColor = [UIColor whiteColor];
    
    button0_ = [self newButtonWithID:0];
    button1_ = [self newButtonWithID:1];
    button2_ = [self newButtonWithID:2];

    closeButton_ = [UIButton buttonWithType:UIButtonTypeSystem];
    [closeButton_ setTitle:@"Close" forState:UIControlStateNormal];
    [closeButton_ addTarget:self action:@selector(close:) forControlEvents:UIControlEventTouchUpInside];
    
    UIView* superview = self.view;
    // --- VFL GENERATED CODE ---
    /*
     center[button0_(200)]
     center[button1_(200)]
     center[button2_(200)]
     center[closeButton_(200)]
     V:|-100-[button0_(44)]-20-[button1_(44)]-20-[button2_(44)]-20-[closeButton_(44)]
     */
    {
        // You need to predefine superview before this.

        CGRect frame;

        frame = button1_.frame;
        frame.size.width = 200;
        frame.origin.x = (superview.bounds.size.width - frame.size.width) / 2.0;
        frame.origin.y = 0 + 100 + 44 + 20;
        frame.size.height = 44;
        button1_.frame = frame;
        button1_.autoresizingMask |= UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        button1_.autoresizingMask |= UIViewAutoresizingFlexibleBottomMargin;
        [superview addSubview:button1_];

        frame = button0_.frame;
        frame.size.width = 200;
        frame.origin.x = (superview.bounds.size.width - frame.size.width) / 2.0;
        frame.origin.y = 0 + 100;
        frame.size.height = 44;
        button0_.frame = frame;
        button0_.autoresizingMask |= UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        button0_.autoresizingMask |= UIViewAutoresizingFlexibleBottomMargin;
        [superview addSubview:button0_];

        frame = closeButton_.frame;
        frame.size.width = 200;
        frame.origin.x = (superview.bounds.size.width - frame.size.width) / 2.0;
        frame.origin.y = 0 + 100 + 44 + 20 + 44 + 20 + 44 + 20;
        frame.size.height = 44;
        closeButton_.frame = frame;
        closeButton_.autoresizingMask |= UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        closeButton_.autoresizingMask |= UIViewAutoresizingFlexibleBottomMargin;
        [superview addSubview:closeButton_];

        frame = button2_.frame;
        frame.size.width = 200;
        frame.origin.x = (superview.bounds.size.width - frame.size.width) / 2.0;
        frame.origin.y = 0 + 100 + 44 + 20 + 44 + 20;
        frame.size.height = 44;
        button2_.frame = frame;
        button2_.autoresizingMask |= UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        button2_.autoresizingMask |= UIViewAutoresizingFlexibleBottomMargin;
        [superview addSubview:button2_];

    }
    // --- END OF CODE GENERATED FROM VFL ---
}

- (UIButton*)newButtonWithID:(int)ID {
    UIButton* button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:[NSString stringWithFormat:@"Button %d", ID] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    button.tag = ID;
    return button;
}

- (void)buttonTapped:(UIButton*)button {
    [[HUEventHandler instance] handleEventButtonTapped_buttonID: (int)button.tag];
}

- (void)close:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
