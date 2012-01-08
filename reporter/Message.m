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
        self.text = @"";
    }
    return self;
}

- (void)dealloc {
    [photos release];
    [text release];
    [super dealloc];
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:text forKey:@"MReporterMessageText"];
    [coder encodeObject:photos forKey:@"MReporterMessageTextPhotos"];
}

- (id)initWithCoder:(NSCoder *)coder {
    text = [[coder decodeObjectForKey:@"MReporterMessageText"] retain];
    photos = [[coder decodeObjectForKey:@"MReporterMessageTextPhotos"] retain];
    return self;
}

@end
