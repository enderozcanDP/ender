//
//  AppDelegate.h
//  OSX
//
//  Created by Nicholas Haurus on 3/28/12.
//  Copyright (c) Haurus Inc. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "BonjourServer.h"

@interface AppDelegate : NSObject <NSApplicationDelegate> {
    BonjourServer *bonjourServer;
}

@property (assign) IBOutlet NSWindow *window;

@end
