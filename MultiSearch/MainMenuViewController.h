//
//  MainMenuViewController.h
//  MultiSearch
//
//  Created by iD Student on 7/1/13.
//  Copyright (c) 2013 Phil. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootViewController.h"

@class RootViewController;

@interface MainMenuViewController : UIViewController

@property (strong, nonatomic) RootViewController *rootViewController;
@property (strong, nonatomic) NSString *address1;
@property (strong, nonatomic) NSString *address2;
@property (strong, nonatomic) NSString *unfixedTerm;
@property (strong, nonatomic) NSString *fixedTerm;
@property (strong, nonatomic) NSMutableArray *column;
@property (strong, nonatomic) IBOutlet UITextField *searchField;
@property (strong, nonatomic) IBOutlet UIImageView *logo;
@property (strong, nonatomic) IBOutlet UIPickerView *pickerView;

-(IBAction)switchToWebBrowserView:(id)sender;
-(IBAction)getSearchTermAndRun:(id)sender;
-(IBAction)hideKeyboard:(id)sender;

@end
