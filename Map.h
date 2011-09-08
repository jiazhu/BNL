//
//  Map.h
//  BNL
//
//  Created by Jia Zhu on 5/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface AddressAnnotation : NSObject <MKAnnotation>
{
    CLLocationCoordinate2D coordinate;
    
    NSString *title;
    NSString *subtitle;
    
}
@end

@interface Map : UIViewController{
    
    IBOutlet MKMapView *mapView;    
    AddressAnnotation *addAnnotation;    
}
- (IBAction)showAddress;

@end
