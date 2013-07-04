//
//  MyViewController.m
//  MultiSearch
//
//  Created by iD Student on 7/3/13.
//  Copyright (c) 2013 Phil. All rights reserved.
//

#import "MyViewController.h"

@interface MyViewController ()
{
    int pageNumber;
}
@end

@implementation MyViewController

@synthesize mainMenuViewController, webView, address;


// Load the view nib and initialize the pageNumber ivar.
- (id)initWithPageNumber:(NSUInteger)page
{
    if (self = [super initWithNibName:@"MyViewController" bundle:nil])
    {
        pageNumber = page;
    }
    return self;
}


// Set the label and background color when the view has finished loading.
- (void)viewDidLoad
{
    [super viewDidLoad];
    [[webView layer] setCornerRadius:10];
    [webView setClipsToBounds:YES];
    [[webView layer] setBorderColor: [[UIColor blackColor] CGColor]];
    [[webView layer] setBorderWidth: 2.0];
    [self startUp:nil];
}


-(void)viewWillAppear:(BOOL)animated
{
    [self.navigationController.navigationBar setBarStyle:UIBarStyleBlack];
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style: UIBarButtonItemStylePlain target: self action:@selector(switchToMainMenuView:)];
    self.navigationItem.leftBarButtonItem = backButton;
}


//Switches back to the main view controller.
-(IBAction)switchToMainMenuView:(id)sender
{
    self.mainMenuViewController = [[UIViewController alloc] initWithNibName:@"MainMenuViewController" bundle:nil];
    [self.navigationController popViewControllerAnimated:YES];
}


//Does web view thingies.(I don't know how it works, it just does.)
-(BOOL)webView: (UIWebView *)browser shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    if (navigationType == UIWebViewNavigationTypeLinkClicked)
    {
        NSURL *url = [request URL];
        
        if([[url scheme] isEqualToString:@"http"])
        {
            [browser loadRequest:[NSURLRequest requestWithURL:url]];
        }
        return NO;
    }
    return YES;
}

//Takes fixed url and fires the request.
-(void)startUp:(id)sender
{
    [webView loadRequest:[self getRequest:address]];
}


-(NSURLRequest*)getRequest:(NSString *)stringAddress
{
    NSURL *url = [NSURL URLWithString:stringAddress];
    return [NSURLRequest requestWithURL:url];
}

@end
