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

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:text forKey:@"MReporterMessageText"];
    [coder encodeObject:photos forKey:@"MReporterMessageTextPhotos"];
}

- (id)initWithCoder:(NSCoder *)coder {
    text = [[coder decodeObjectForKey:@"MReporterMessageText"] retain];
    photos = [[coder decodeObjectForKey:@"MReporterMessageText"] retain];
    return self;
}

@end
