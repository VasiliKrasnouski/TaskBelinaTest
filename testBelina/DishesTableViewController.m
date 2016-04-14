//
//  DishesTableViewController.m
//  testBelina
//
//  Created by FanLee on 10/02/16.
//  Copyright © 2016 Vasili Krasnouski. All rights reserved.
//

#import "DishesTableViewController.h"
#import "DishDetailViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface DishesTableViewController ()
@property(nonatomic, strong) NSDictionary* objectAtRowDict;
@property(nonatomic,strong) NSArray *sortedArray;

@end

@implementation DishesTableViewController

- (void)viewDidLoad {
    
    NSSortDescriptor *nameDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    NSSortDescriptor *categDescriptor = [[NSSortDescriptor alloc] initWithKey:@"categoryId" ascending:YES];
    NSArray *descriptors = @[nameDescriptor,categDescriptor];
    
    _sortedArray = [_currentCategoryElements sortedArrayUsingDescriptors:descriptors];
    
    [super viewDidLoad];
    
    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [_currentCategoryElements count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
   
    
    _objectAtRowDict = [_sortedArray objectAtIndex:indexPath.row];
    cell.textLabel.text = [[_objectAtRowDict allValues] objectAtIndex:6];
    
    NSURL *imageUrl = [NSURL URLWithString:[[_objectAtRowDict allValues] objectAtIndex:3]];
    
    [cell.imageView sd_setImageWithURL:imageUrl placeholderImage:[UIImage imageNamed:@"imagename.png"] options:SDWebImageRefreshCached completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageUrl)
     {
         [cell layoutSubviews];
         
     }
     ];
    
    
    return cell;
}

-(NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    _objectAtRowDict = [_sortedArray objectAtIndex:indexPath.row];
    _currentProductImage = [tableView cellForRowAtIndexPath:indexPath].imageView.image;

    return indexPath;
}



-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"dishDetail"]) {
        
        DishDetailViewController *vc = segue.destinationViewController;
        vc.currentDish = _objectAtRowDict;
        vc.productImage = _currentProductImage;        
        
    }
}



@end
