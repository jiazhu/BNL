//
//  ConnectSQL.m
//  BNL
//
//  Created by Jia Zhu on 7/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ConnectSQL.h"

@implementation ConnectSQL
@synthesize txtName;
- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (IBAction)insert:(id)sender
{
    
    //php file url to call
    NSString *strURL = [NSString stringWithFormat:@"http://localhost/xxx/phpFile.php?name=%@", txtName.text];
    
    //to execute php code
    NSData *dataURL = [NSData dataWithContentsOfURL:[NSURL URLWithString:strURL]];
        
    //to receive the returned value
    NSString *strResult = [[[NSString alloc] initWithData:dataURL encoding:NSUTF8StringEncoding] autorelease];
    
    NSLog(@"%@", strResult);

}

- (void)dealloc
{
    [txtName release];   
}
@end
