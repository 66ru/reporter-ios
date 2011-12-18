//
//  Message.m
//  reporter
//
//  Created by Andrey Putilov on 12/18/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "Message.h"

@implementation Message

@synthesize text, photos;

- (id)init {
    self = [super init];
    if (self) {
        self.photos = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)dealloc {
    [photos release];
    [super dealloc];
}

@end
