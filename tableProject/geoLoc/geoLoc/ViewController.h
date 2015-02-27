//
//  ViewController.h
//  geoLoc
//
//  Created by João Vitor dos Santos Schimmelpfeng on 26/02/15.
//  Copyright (c) 2015 João Vitor dos Santos Schimmelpfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreData/CoreData.h>

@interface ViewController : UIViewController <CLLocationManagerDelegate>
{
 CLLocationCoordinate2D loc;
}
@property (weak, nonatomic) IBOutlet MKMapView *mapa;
@property CLLocationManager *locMan;
@property MKPointAnnotation *ponto;

- (IBAction)atualizar:(id)sender;

@end

