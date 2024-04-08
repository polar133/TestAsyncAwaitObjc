//
//  CustomView.m
//  TestAsyncAwaitObjc
//
//  Created by Carlos Jimenez on 2024-04-08.
//

#import "CustomView.h"
#import "TestAsyncAwaitObjc-Swift.h"

@implementation CustomView

- (instancetype)init {
    self = [super init];
    if (self) {
        // Initialize the UIButton and set its properties
        self.button = [UIButton buttonWithType:UIButtonTypeSystem];
        self.button.translatesAutoresizingMaskIntoConstraints = NO;
        [self.button setTitle:@"Tap Me" forState:UIControlStateNormal];

        // Set the button's action
        [self.button addTarget:self
                        action:@selector(buttonTapped)
              forControlEvents:UIControlEventTouchUpInside];

        // Add the button to the view
        [self addSubview:self.button];

        // Add constraints so the button is positioned in the center of the view
        [NSLayoutConstraint activateConstraints:@[
            [self.button.centerXAnchor constraintEqualToAnchor:self.centerXAnchor],
            [self.button.centerYAnchor constraintEqualToAnchor:self.centerYAnchor]
        ]];
    }
    return self;
}

- (void)buttonTapped {
    NSLog(@"Button tapped!");

    // Initialize AsyncBridge
    AsyncBridge *bridge = [[AsyncBridge alloc] init];

    [bridge callAsyncMethodWithCompletionHandler:^(NSString * result, NSError * error) {
        if (error) {
            NSLog(@"Error: %@", error);
        } else {
            NSLog(@"Result: %@", result);
        }
    }];

}

@end
