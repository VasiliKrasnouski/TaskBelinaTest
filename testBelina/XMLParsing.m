//
//  XMLParsing.m
//  test
//
//  Created by FanLee on 05/02/16.
//  Copyright © 2016 Vasili Krasnouski. All rights reserved.
//

#import "XMLParsing.h"
#import "AFNetworking.h"
#import "XMLDictionary.h"

NSString *const DataDownloadedNotification = @"DataDownloadedNotification";

@implementation XMLParsing

-(void)requestFromServer{
    
    NSURL *URL = [NSURL URLWithString:@"http://ufa.farfor.ru/getyml/?key=ukAXxeJYZN"];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    dispatch_async(dispatch_get_main_queue(),^{
        AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
        operation.responseSerializer = [AFXMLParserResponseSerializer serializer];
        operation.responseSerializer.stringEncoding = NSWindowsCP1251StringEncoding;
        [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            NSDictionary *rootDictionary = [NSDictionary dictionaryWithXMLParser:(NSXMLParser*)responseObject];
            
            [[NSNotificationCenter defaultCenter] postNotificationName:DataDownloadedNotification object:nil userInfo:rootDictionary];
        } failure:nil];
        
        [operation start];
    });
}

@end
