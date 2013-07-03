//
//  ViewController.m
//  MultiSearch
//
//  Created by iD Student on 6/27/13.
//  Copyright (c) 2013 Phil. All rights reserved.
//

#import "WebBrowserViewController.h"

@interface WebBrowserViewController ()

@end

@implementation WebBrowserViewController

@synthesize mainMenuViewController, webView, webView2, pageControl, address1, address2;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self startUp:nil];
}


-(void)viewWillAppear:(BOOL)animated
{
    [self.navigationController.navigationBar setBarStyle:UIBarStyleBlack];
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style: UIBarButtonItemStylePlain target: self action:@selector(switchToMainMenuView:)];
    self.navigationItem.leftBarButtonItem = backButton;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//Switches back to the main view controller.
-(IBAction)switchToMainMenuView:(id)sender
{
    self.mainMenuViewController = [[UIViewController alloc] initWithNibName:@"MainMenuViewController" bundle:nil];
    [self.navigationController popViewControllerAnimated:YES];
}


//Does web view thingies.(I don't know how it works, it just does.)
-(BOOL)webView: (UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    if (navigationType == UIWebViewNavigationTypeLinkClicked)
    {
        NSURL *url = [request URL];
        
        if([[url scheme] isEqualToString:@"http"])
        {
            [self startUp:nil];
        }
        return NO;
    }
    return YES;
}

//Takes fixed url and fires the request.
-(void)startUp:(id)sender
{
    [webView loadRequest:[self getRequest:address1]];
    [webView2 loadRequest:[self getRequest:address2]];
}


-(NSURLRequest*)getRequest:(NSString *)address
{
    NSURL *url = [NSURL URLWithString:address];
    return [NSURLRequest requestWithURL:url];
}

- (IBAction)changePage:(id)sender
{
    
}

@end
