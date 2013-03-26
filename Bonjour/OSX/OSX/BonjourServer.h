//
//  BonjourServer.h
//  OSX
//
//  Created by Nicholas Haurus on 3/28/12.
//  Copyright (c) Haurus Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <netinet/in.h>
#import <sys/socket.h>

@interface BonjourServer :  NSObject <NSNetServiceDelegate,NSStreamDelegate> {
    NSMutableArray *services;
    NSSocketPort *socket;
    NSNetService *service;
    struct sockaddr *addr;
    int port;    
    BOOL searching;
    NSInputStream		*inputStream;
	NSOutputStream		*outputStream;
	BOOL				inReady;
	BOOL				outReady;
    NSMutableData *dataBuffer;
}

@end