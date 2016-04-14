//
//  ContactDataViewController.m
//  testBelina
//
//  Created by FanLee on 12/02/16.
//  Copyright © 2016 Vasili Krasnouski. All rights reserved.
//

#import "ContactDataViewController.h"

@interface ContactDataViewController ()

@end

@implementation ContactDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
   
    if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [self.locationManager requestWhenInUseAuthorization];
        [self.locationManager requestAlwaysAuthorization];
    }
    [self.locationManager startUpdatingLocation];
    _userMapView.delegate = self;
    _userMapView.showsUserLocation = YES;
    
    
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) initLocationManager:(CLLocationManager *) locationManager{
    
    locationManager = [[CLLocationManager alloc]init];
    
    if([locationManager respondsToSelector:@selector(requestAlwaysAuthorization)])
        [locationManager requestAlwaysAuthorization];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    NSLog(@"%@", [locations lastObject]);
}

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation{
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 11113800, 11113800);
    [_userMapView setRegion:[_userMapView regionThatFits:region] animated:YES];
    
    // Add an annotation
    MKPointAnnotation *point1= [[MKPointAnnotation alloc] init];
    point1.coordinate = userLocation.coordinate;
    point1.title = @"Where am I?";
    point1.subtitle = @"I'm here!!!";
    
    MKPointAnnotation *point2 = [[MKPointAnnotation alloc] init];
    point2.coordinate = CLLocationCoordinate2DMake(33.33233141, -115.03121860);
    point2.title = @"Papa Johs";
    point2.subtitle = @"223 avenue";
    
    MKPointAnnotation *point3 = [[MKPointAnnotation alloc] init];
    point3.coordinate = CLLocationCoordinate2DMake(33.33233141, -110.03121860);
    point3.title = @"Pizza Bar";
    point3.subtitle = @"150 street";
    
    
    
    [_userMapView addAnnotation:point1];
    [_userMapView addAnnotation:point2];
    [_userMapView addAnnotation:point3];
    
}

@end
