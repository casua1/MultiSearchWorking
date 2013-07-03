//
//  ViewController.h
//  MultiSearch
//
//  Created by iD Student on 6/27/13.
//  Copyright (c) 2013 Phil. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebBrowserViewController : UIViewController

@property (strong, nonatomic) UIViewController *mainMenuViewController;
@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) IBOutlet UIWebView *webView2;
@property (strong, nonatomic) IBOutlet UIPageControl *pageControl;
@property (strong, nonatomic) NSString *address1;
@property (strong, nonatomic) NSString *address2;



-(BOOL)webView: (UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType;
-(NSURLRequest*)getRequest:(NSString *)tempAddress;
-(IBAction)changePage:(id)sender;




@end
