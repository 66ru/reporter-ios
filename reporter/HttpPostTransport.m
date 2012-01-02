//
//  HttpPostTransport.m
//  reporter
//
//  Created by Andrey Putilov on 12/18/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "HttpPostTransport.h"

@implementation HttpPostTransport 
@synthesize delegate;

- (void)beginUploadMessage:(Message *)message {
    if (message != nil) {
        NSURL *uploadUrl = [NSURL URLWithString:@"http://ns-keip.ru/media/200.txt"];
        NSMutableDictionary *dictionary = [[[NSMutableDictionary alloc] init] autorelease];
        [dictionary setObject:@"value1" forKey:@"key1"];
        [dictionary setObject:@"value2" forKey:@"key2"];
        
        UIImprovedImage *image = [message.photos objectAtIndex:0];
        NSURLRequest *urlRequest = [self formPOSTFileDataRequestWithURLWithVariables:uploadUrl data:image.jpgData fileName:@"1.txt" variables:dictionary];
        urlConnection = [[NSURLConnection alloc] initWithRequest:urlRequest delegate:self];
    }
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    [receivedData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    [delegate httpPostTransport:self didCompleteUploadWithError:error];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    [delegate httpPostTransport:self didCompleteUploadWithCode:0];
    
    [urlConnection release];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [receivedData appendData:data];
}

// todo: modify for several files upload
- (NSURLRequest *)formPOSTFileDataRequestWithURLWithVariables:(NSURL *)url data:(NSData *)data fileName:(NSString *)fileName variables:(NSMutableDictionary*)variables {
    // from http://www.cocoadev.com/index.pl?HTTPFileUpload
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];
    [urlRequest setHTTPMethod:@"POST"];
    
    NSString *myboundary = [NSString stringWithString:@"---------------------------14737809831466499882746641449"];
    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",myboundary];
    [urlRequest addValue:contentType forHTTPHeaderField: @"Content-Type"];
    
    NSMutableData *postData = [NSMutableData data]; //[NSMutableData dataWithCapacity:[data length] + 512];

    // adding arbitrary variables here
    for (NSString* key in variables) {
        id value = [variables objectForKey:key];
        
        // do stuff
        if(value!=nil){
            [postData appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n", myboundary] dataUsingEncoding:NSUTF8StringEncoding]];
            [postData appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n", key] dataUsingEncoding:NSUTF8StringEncoding]];
            [postData appendData:[[NSString stringWithFormat:@"%@\r\n", value] dataUsingEncoding:NSUTF8StringEncoding]];
        }
    }
    
    // finished adding
    [postData appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n", myboundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [postData appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"userfile\"; filename=\"%@\"\r\n", fileName]dataUsingEncoding:NSUTF8StringEncoding]];
    [postData appendData:[[NSString stringWithString:@"Content-Type: application/octet-stream\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    [postData appendData:[NSData dataWithData:data]];
    
    [postData appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n", myboundary] dataUsingEncoding:NSUTF8StringEncoding]];
    
    [urlRequest setHTTPBody:postData];
    
    return urlRequest;
}

@end
