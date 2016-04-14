//
//  ContactDataViewController.h
//  testBelina
//
//  Created by FanLee on 12/02/16.
//  Copyright © 2016 Vasili Krasnouski. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MapKit/MapKit.h"

@import CoreLocation;


@interface ContactDataViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *userMapView;
@property (strong, nonatomic) CLLocationManager *locationManager;

@end
