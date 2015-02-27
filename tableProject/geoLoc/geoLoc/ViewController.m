//
//  ViewController.m
//  geoLoc
//
//  Created by João Vitor dos Santos Schimmelpfeng on 26/02/15.
//  Copyright (c) 2015 João Vitor dos Santos Schimmelpfeng. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>
#import <CoreData/CoreData.h>

@interface ViewController ()

@end

@implementation ViewController
@synthesize mapa,locMan,ponto;

- (void)viewDidLoad
{
    [super viewDidLoad];
    locMan = [[CLLocationManager alloc] init];
    [locMan requestWhenInUseAuthorization];
    [locMan setDesiredAccuracy:kCLLocationAccuracyBest];
    [locMan setDelegate:self];
    
    [locMan startUpdatingLocation];
    
    ponto = [[MKPointAnnotation alloc] init];
    
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    
    loc = [[locations lastObject] coordinate];
    [ponto setCoordinate:loc];
}

-(void) locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)atualizar:(id)sender
{
 MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(loc, 250, 250);
 [mapa setRegion:region animated:YES ];
    [mapa addAnnotation:ponto];
}
@end
