//
//  MyViewController.h
//  MultiSearch
//
//  Created by iD Student on 7/3/13.
//  Copyright (c) 2013 Phil. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface MyViewController : UIViewController

@property (strong, nonatomic) UIViewController *mainMenuViewController;
@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) NSString *address;


-(BOOL)webView: (UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType;
-(NSURLRequest*)getRequest:(NSString *)address;
-(id)initWithPageNumber:(NSUInteger)page;

@end
