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
NSMutableData *webData; 

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
    NSString *strURL = [NSString stringWithFormat:@"http://i-triple.com/bnl/storeUserUsageInfo.php?name=%@", txtName.text];
    
    //to execute php code
    NSData *dataURL = [NSData dataWithContentsOfURL:[NSURL URLWithString:strURL]];
        
    //to receive the returned value
    NSString *strResult = [[[NSString alloc] initWithData:dataURL encoding:NSUTF8StringEncoding] autorelease];
    
    NSLog(@"%@", strResult);

}

- (IBAction)select:(id)sender
{
           
        
   
        
        NSString *post = 
        [[NSString alloc] initWithFormat:@"uname=%@&pwd=%@",'username','pass'];
        
        NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];  
        
        NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];  
        
        NSURL *url = [NSURL URLWithString:@"http://i-triple.com/bnl/getData.php?filter"];
        NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
        [theRequest setHTTPMethod:@"POST"];  
        [theRequest setValue:postLength forHTTPHeaderField:@"Content-Length"];  
        [theRequest setHTTPBody:postData];      
        
        
        NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
        
        if( theConnection )
        {
            webData = [[NSMutableData data] retain];
        }
        else
        {
            
        }
        
}       
        
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
        [webData setLength: 0];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
        
        
        [webData appendData:data];
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
        
        [connection release];
        [webData release];
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
        
        NSString *loginStatus = [[NSString alloc] initWithBytes: [webData mutableBytes] length:[webData length] encoding:NSUTF8StringEncoding];
        NSLog(loginStatus);
       
        [loginStatus release];
        
        
        
        [connection release];
        [webData release];
}


- (void)dealloc
{
    [txtName release];   
}

@end
