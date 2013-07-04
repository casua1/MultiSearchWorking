//
//  RootViewController.h
//  MultiSearch
//
//  Created by iD Student on 7/3/13.
//  Copyright (c) 2013 Phil. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainMenuViewController.h"
#import "MyViewController.h"

@interface RootViewController : UIViewController <UIScrollViewDelegate>

@property (strong, nonatomic) NSString *address1;
@property (strong, nonatomic) NSString *address2;

@end
