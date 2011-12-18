//
//  TransportManager.h
//  reporter
//
//  Created by Andrey Putilov on 12/18/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Message.h"
#import "HttpPostTransport.h"

@protocol TransportManagerDelegate;


@interface TransportManager : NSObject <HttpPostTransportDelegate>

@property (assign)id<TransportManagerDelegate> delegate;
- (void)sendMessage:(Message *)message;

@end


@protocol TransportManagerDelegate <NSObject>

@optional
- (void)transportManager:(TransportManager *)transportManager didFinishUpload:(NSInteger)code;
- (void)transportManager:(TransportManager *)transportManager didFinishUploadWithError:(NSError *)error;

@end