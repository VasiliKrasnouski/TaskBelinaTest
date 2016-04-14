//
//  XMLParsing.h
//  test
//
//  Created by FanLee on 05/02/16.
//  Copyright © 2016 Vasili Krasnouski. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *const DataDownloadedNotification;

@interface XMLParsing : NSObject
@property(nonatomic, strong) NSDictionary* categories;
@property(nonatomic, strong) NSDictionary* offers;

-(void)requestFromServer;

@end
