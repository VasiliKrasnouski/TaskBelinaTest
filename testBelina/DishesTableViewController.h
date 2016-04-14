//
//  DishesTableViewController.h
//  testBelina
//
//  Created by FanLee on 10/02/16.
//  Copyright © 2016 Vasili Krasnouski. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DishesTableViewController : UITableViewController
@property(nonatomic, strong) NSString* categoryID;
@property(nonatomic, strong) NSDictionary* categoryObject;
@property(nonatomic, strong) NSMutableArray* currentCategoryElements;
@property(nonatomic, strong) UIImage* currentProductImage;

@end
