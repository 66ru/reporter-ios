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
        self.photos = [[[NSMutableArray alloc] init] autorelease];
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
    self.text = [coder decodeObjectForKey:@"MReporterMessageText"];
    self.photos = [coder decodeObjectForKey:@"MReporterMessageTextPhotos"];
    return self;
}

@end
