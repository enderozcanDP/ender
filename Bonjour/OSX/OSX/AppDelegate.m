//
//  AppDelegate.m
//  OSX
//
//  Created by Nicholas Haurus on 3/28/12.
//  Copyright (c) Haurus Inc. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize window = _window;

- (void)dealloc
{
    [super dealloc];
}
	
- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    bonjourServer = [[BonjourServer alloc] init];
}

@end
