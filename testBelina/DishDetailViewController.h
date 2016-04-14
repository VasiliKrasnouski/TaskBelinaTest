//
//  DishDetailViewController.h
//  testBelina
//
//  Created by FanLee on 11/02/16.
//  Copyright © 2016 Vasili Krasnouski. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DishDetailViewController : UIViewController

@property(nonatomic, strong) NSDictionary* currentDish;
@property (strong, nonatomic) IBOutlet UIImageView *imageV;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *url;
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (weak, nonatomic) IBOutlet UILabel *ingredients;
@property (weak, nonatomic) IBOutlet UILabel *diametr;
@property (weak, nonatomic) IBOutlet UILabel *weight;
@property (weak, nonatomic) IBOutlet UILabel *energy;
@property (weak, nonatomic) IBOutlet UILabel *proteins;
@property (weak, nonatomic) IBOutlet UILabel *fats;
@property (weak, nonatomic) IBOutlet UILabel *carbohydrates;
@property (weak, nonatomic) IBOutlet UILabel *quantity;
@property (weak, nonatomic) IBOutlet UILabel *diametrNameLabel;
@property (weak, nonatomic) NSURL* imageUrl;
@property (strong,nonatomic) UIImage *productImage;


@end
