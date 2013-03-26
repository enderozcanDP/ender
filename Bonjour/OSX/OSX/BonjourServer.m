//
//  BonjourServer.m
//  OSX
//
//  Created by Nicholas Haurus on 3/28/12.
//  Copyright (c) Haurus Inc. All rights reserved.
//

#import "BonjourServer.h"

@implementation BonjourServer

-(id)init {
    services = [[NSMutableArray alloc] init];
    socket = [[NSSocketPort alloc] init];
    searching = NO;
    
    if(socket) {
        addr = (struct sockaddr *)[[socket address] bytes];
        if(addr->sa_family == AF_INET) {
            port = ntohs(((struct sockaddr_in *)addr)->sin_port);
        }
        else if(addr->sa_family == AF_INET6) {
            port = ntohs(((struct sockaddr_in6 *)addr)->sin6_port);
        }
        else {
            [socket release];
            socket = nil;
            NSLog(@"The family is neither IPv4 nor IPv6. Can't handle.");
        }
    }
    else {
        NSLog(@"An error occurred initializing the NSSocketPort object.");
    }
    if(socket)
    {
        service = [[NSNetService alloc] initWithDomain:@"local." type:@"_ipp._tcp." name:@"haurus" port:port];
        
        if ([service getInputStream:&inputStream outputStream:&outputStream]) {
            NSLog(@"service has stream references");
        }
        
        if(service) {
            [service setDelegate:self];
            [service publish];
        }
        else {
            NSLog(@"An error occurred initializing the NSNetService object.");
        }
        
    }
    else {
        NSLog(@"An error occurred initializing the NSSocketPort object.");
    }
    return self;
}

#pragma mark - NSNetServiceDelegate

- (void)netServiceWillPublish:(NSNetService *)netService {
    NSLog(@"netServiceWillPublish");
    [services addObject:netService];
}

- (void)netServiceDidPublish:(NSNetService *)sender {
    NSLog(@"netServiceDidPublish");
}

- (void)netService:(NSNetService *)sender didNotPublish:(NSDictionary *)errorDict {
    NSLog(@"didNotPublish");
}

- (void)netServiceWillResolve:(NSNetService *)sender {
    NSLog(@"netServiceWillResolve");
}

- (void)netServiceDidResolveAddress:(NSNetService *)sender {
    NSLog(@"netServiceDidResolveAddress");    
}

- (void)netService:(NSNetService *)sender didNotResolve:(NSDictionary *)errorDict {
    NSLog(@"didNotResolve");
}

- (void)netService:(NSNetService *)sender didUpdateTXTRecordData:(NSData *)data {
    NSLog(@"didUpdateTXTRecordData");
}

- (void)netServiceDidStop:(NSNetService *)netService {
    NSLog(@"netServiceDidStop");
    [services removeObject:netService];
}

@end
