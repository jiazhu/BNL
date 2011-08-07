//
//  ConnectSQL.h
//  BNL
//
//  Created by Jia Zhu on 7/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ConnectSQL : NSObject <UIApplicationDelegate>

//create propert for text field
@property (nonatomic, retain) IBOutlet UITextField *txtName;

//create propert for insert button;

- (IBAction)insert:(id)sender;

@end
