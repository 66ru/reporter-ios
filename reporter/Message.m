//
//  Message.m
//  reporter
//
//  Created by Andrey Putilov on 12/18/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "Message.h"

@implementation Message
// todo: send modelChanged notification
// NSNotificationCenter: http://developer.apple.com/library/ios/#samplecode/KeyboardAccessory/Listings/Classes_ViewController_m.html
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
