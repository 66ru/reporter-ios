//
//  Persistence.m
//  reporter
//
//  Created by Alexander Manichev on 18.12.11.
//  Copyright (c) 2011 a.manichev@gmail.com. All rights reserved.
//

#import "Persistence.h"

@implementation Persistence

- (id)init {
    self = [super init];
    
    NSString *docsDir;
    NSArray *dirPaths;

    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    docsDir = [dirPaths objectAtIndex:0];
    dataFilePath = [[NSString alloc] initWithString: [docsDir stringByAppendingPathComponent: @"data.archive"]];
  
    return self;
}

- (void)save: (id)Object {
    
    NSMutableData *data;
    NSKeyedArchiver *archiver;
    BOOL result;
    
    data = [NSMutableData data];
    archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    // Customize archiver here
    [archiver encodeObject:Object forKey:@"MReporter"];
    [archiver finishEncoding];
    result = [data writeToFile:dataFilePath atomically:YES];
    
    if(result) {
        NSLog(@"saved");
    } else {
        NSLog(@"not been saved");
    }
    
    [archiver release];
    
}

- (id)getObject {

    NSData *data;
    NSKeyedUnarchiver *unarchiver;
    
    data = [NSData dataWithContentsOfFile:dataFilePath];
    unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];

    id object = [unarchiver decodeObjectForKey:@"MReporter"];
    
    [unarchiver finishDecoding];
    [unarchiver release];
    
    return object;
}

- (void)dealloc {
    [dataFilePath release];
    [super dealloc];
}

@end
