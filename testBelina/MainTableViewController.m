//
//  MainTableViewController.m
//  testBelina
//
//  Created by FanLee on 07/02/16.
//  Copyright © 2016 Vasili Krasnouski. All rights reserved.
//

#import "MainTableViewController.h"
#import "XMLParsing.h"
#import "DishesTableViewController.h"

@interface MainTableViewController ()
@property(strong,nonatomic) NSArray* categoriesArray;
@property(strong, nonatomic) NSArray* offers;
@property(strong, nonatomic) NSDictionary* categoryValues;
@property(strong, nonatomic) NSMutableArray* currentCategoryElements;
@property(strong,nonatomic) id objectAtRow;
@end

@implementation MainTableViewController

- (void)viewDidLoad {
    
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(updateView:) name:DataDownloadedNotification object:nil];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewDidLoad];
    XMLParsing *xmlparser = [XMLParsing new];
    [xmlparser requestFromServer];
    UISwipeGestureRecognizer * swiperight=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swiperight:)];
    swiperight.direction=UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swiperight];
   
    
    
}
-(void)updateView:(NSNotification*)notification{
    
    NSDictionary *menuDict = [notification.userInfo valueForKey:@"shop"];
    _offers = [[[menuDict valueForKey:@"offers"] allValues]objectAtIndex:0];
    _categoriesArray = [[[menuDict valueForKey:@"categories"] allValues] objectAtIndex:0];

    NSSortDescriptor *idDescriptor = [[NSSortDescriptor alloc] initWithKey:@"id" ascending:YES];
    NSSortDescriptor *textDescriptor = [[NSSortDescriptor alloc] initWithKey:@"_text" ascending:YES];
    NSArray *descriptors = @[idDescriptor,textDescriptor];
    _categoriesArray = [_categoriesArray sortedArrayUsingDescriptors:descriptors];
    
    [self.tableView numberOfRowsInSection:[_categoriesArray count]];
    [self.tableView reloadData];
}
-(void)viewWillDisappear:(BOOL)animated{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
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
    
    return [_categoriesArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    _categoryValues = [_categoriesArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [[_categoryValues allValues]objectAtIndex:1];
    
    return cell;
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"detailTableseque"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        _objectAtRow = [_categoriesArray objectAtIndex: indexPath.row];
        DishesTableViewController *dvc = segue.destinationViewController;
        dvc.categoryObject = _objectAtRow;
        NSString* categoryId = [[_objectAtRow allValues]objectAtIndex:0];
        _currentCategoryElements= [NSMutableArray new];
        for (id element in _offers) {
            if ([[element valueForKey:@"categoryId"] isEqualToString:categoryId]) {
                [_currentCategoryElements addObject:element];
            }
        }
        
        dvc.currentCategoryElements = _currentCategoryElements;
    }//else if ([segue.identifier isEqualToString:@"leftsidebarmenu"]){
    
    //}
    
    
}

-(void)swiperight:(UISwipeGestureRecognizer*)gestureRecognizer
{
    [self performSegueWithIdentifier:@"leftsidebarmenu" sender:self];
}




@end
