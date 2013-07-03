//
//  MainMenuViewController.h
//  MultiSearch
//
//  Created by iD Student on 7/1/13.
//  Copyright (c) 2013 Phil. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebBrowserViewController.h"

@class WebBrowserViewController;

@interface MainMenuViewController : UIViewController


@property (strong, nonatomic) WebBrowserViewController *webBrowserViewController;
@property (strong, nonatomic) NSString *address1;
@property (strong, nonatomic) NSString *address2;
@property (strong, nonatomic) NSString *unfixedTerm;
@property (strong, nonatomic) NSString *fixedTerm;
@property (strong, nonatomic) NSMutableArray *column;
@property (strong, nonatomic) IBOutlet UIPickerView *pickerView;

-(IBAction)switchToWebBrowserView:(id)sender;
-(IBAction)getSearchTermAndRun:(id)sender;

@end
