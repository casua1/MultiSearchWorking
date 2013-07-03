//
//  ContentController.h
//  MultiSearch
//
//  Created by iD Student on 7/3/13.
//  Copyright (c) 2013 Phil. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@class  RootViewController;

@interface ContentController : NSObject

@property (nonatomic, strong) IBOutlet RootViewController *rootViewController;
@property (nonatomic, strong) NSArray *contentList;

@end
