//
//  ViewController.m
//  testBelina
//
//  Created by FanLee on 07/02/16.
//  Copyright © 2016 Vasili Krasnouski. All rights reserved.
//

#import "ViewController.h"
#import "XMLParsing.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    XMLParsing *xmlparser = [XMLParsing new];
    [xmlparser requestFromServer];

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
