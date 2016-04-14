//
//  DishDetailViewController.m
//  testBelina
//
//  Created by FanLee on 11/02/16.
//  Copyright © 2016 Vasili Krasnouski. All rights reserved.
//

#import "DishDetailViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface DishDetailViewController ()
@property(nonatomic,strong) id params;
@end

@implementation DishDetailViewController

- (void)viewDidLoad {
    
    
    [super viewDidLoad];
    _ingredients.numberOfLines = 6;
    [_ingredients setFont:[_ingredients.font fontWithSize:13]];
    [_url setFont:[_ingredients.font fontWithSize:12]];
    [self updateData];
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(openUrl)];
    tapGestureRecognizer.numberOfTapsRequired = 1;
    [_url addGestureRecognizer:tapGestureRecognizer];
    _url.userInteractionEnabled = YES;
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    //[self updateData];
}

-(void)updateData{
    _name.text = [_currentDish valueForKey:@"name"];
    _price.text = [_currentDish valueForKey:@"price"];
    _ingredients.text = [_currentDish valueForKey:@"description"];
    _imageUrl = [NSURL URLWithString:[_currentDish valueForKey:@"picture"]];
    _params = [_currentDish valueForKey:@"param"];
    _url.text = [_currentDish valueForKey:@"url"];
    
    if (_productImage !=nil) {
        [_imageV setImage:_productImage];
    }else{

        [_imageV sd_setImageWithURL:_imageUrl placeholderImage:[UIImage imageNamed:@"imagename.png"] options:SDWebImageRefreshCached completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageUrl)
         {
             [_imageV setNeedsDisplay];
             
         }
         ];
    }
        
    
    if ([_params isKindOfClass:[NSArray class]]) {
        
    
        for(int i=0; i<[_params count]; i++){
        NSArray *keys= [[_params objectAtIndex:i]allKeys];
        for (NSString *keysV in keys){
            NSLog(@"Keys are %@", keysV);
            if([[[_params objectAtIndex:i] objectForKey: keysV] isEqual:@"Вес"]){
                _weight.text = [[_params objectAtIndex:i] objectForKey:@"__text"];
            }else if([[[_params objectAtIndex:i] objectForKey: keysV] isEqual:@"Диаметр"]){
                _diametr.text = [[_params objectAtIndex:i] objectForKey:@"__text"];
            }else if([[[_params objectAtIndex:i] objectForKey: keysV] isEqual:@"Каллорийность"]){
                _energy.text = [[_params objectAtIndex:i] objectForKey:@"__text"];
            }else if([[[_params objectAtIndex:i] objectForKey: keysV] isEqual:@"Белки"]){
                _proteins.text = [[_params objectAtIndex:i] objectForKey:@"__text"];
            }else if([[[_params objectAtIndex:i] objectForKey: keysV] isEqual:@"Жиры"]){
                _fats.text = [[_params objectAtIndex:i] objectForKey:@"__text"];
            }else if([[[_params objectAtIndex:i] objectForKey: keysV] isEqual:@"Углеводы"]){
                _carbohydrates.text = [[_params objectAtIndex:i] objectForKey:@"__text"];
            }else if([[[_params objectAtIndex:i] objectForKey: keysV] isEqual:@"Кол-во"]){
                _diametrNameLabel.text = @"Кол-во";
                _diametr.text = [[_params objectAtIndex:i] objectForKey:@"__text"];
            }
        }
        }
    }else if ([_params isKindOfClass:[NSDictionary class]]){
        _weight.text = [_params objectForKey:@"__text"];
    }
}


-(void)openUrl{
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:_url.text]];
}

@end
