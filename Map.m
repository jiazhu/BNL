//
//  Map.m
//  BNL
//
//  Created by Jia Zhu on 5/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Map.h"
@implementation AddressAnnotation

@synthesize coordinate;

- (NSString *)subtitle
{   
    //please modify to retrieve subtitle from database
    return @"Subtitle";
}
- (NSString *)title
{
    return @"Title";
}

-(id)initWithCoordinate:(CLLocationCoordinate2D) c
{
    coordinate = c;
    NSLog(@"%f,$f", c.latitude,c.longitude);
    return self;
}

@end

@implementation Map
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
 // Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
 - (void)viewDidLoad
 {
 [super viewDidLoad];
 }
 */

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self showAddress];
}

- (IBAction) showAddress
{
    
    MKCoordinateRegion region;
    MKCoordinateSpan span;
    span.latitudeDelta=0.2;
    span.longitudeDelta=0.2;
    
    CLLocationCoordinate2D location = mapView.userLocation.coordinate;
    //please modify to retrieve location from database
    location.latitude = -27.520893 ;
    location.longitude = 153.027785;
    region.span=span;
    region.center=location;
    
    if(addAnnotation != nil)
    {
        [mapView removeAnnotation:addAnnotation];
        [addAnnotation release];
        addAnnotation = nil;
    }
    
    addAnnotation = [[AddressAnnotation alloc] initWithCoordinate:location];
    [mapView addAnnotation:addAnnotation];
    
    [mapView setRegion:region animated:TRUE];
    [mapView regionThatFits:region];
    //[mapView selectAnnotation:mLodgeAnnotation animated:YES];
    
}

- (MKAnnotationView *) mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>) annotation
{
    MKPinAnnotationView *annView=[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"currentloc"];
    annView.pinColor = MKPinAnnotationColorGreen;
    annView.animatesDrop=TRUE;
    annView.canShowCallout = YES;
    annView.calloutOffset = CGPointMake(-5, 5);
    return annView;
}


- (void)dealloc
{
    [super dealloc];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
