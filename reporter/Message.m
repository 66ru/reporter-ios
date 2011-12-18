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

- (void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    NSLog(@"hear");
    if ([keyPath isEqual:@"messageText"]) {
        NSString* changedName = [change objectForKey:NSKeyValueChangeNewKey];
        // do something with the changedName - call a method or update the UI here
        self.text = changedName;
    }
}

@end
