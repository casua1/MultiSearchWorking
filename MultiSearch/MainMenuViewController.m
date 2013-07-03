//
//  MainMenuViewController.m
//  MultiSearch
//
//  Created by iD Student on 7/1/13.
//  Copyright (c) 2013 Phil. All rights reserved.
//

#import "MainMenuViewController.h"
#import "WebBrowserViewController.h"

@interface MainMenuViewController ()

@end

@implementation MainMenuViewController

@synthesize webBrowserViewController, address1, address2, unfixedTerm, fixedTerm, column, pickerView;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    column = [[NSMutableArray alloc] initWithObjects:@"Google", @"Yahoo", @"Bing", @"Ask", @"AOL", @"Dogpile", @"Duck Duck Go", nil];
}


//Setting up for the UIPickerView.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView;
{
    return 2;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;
{
    return [column count];
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component;
{
    return [column objectAtIndex:row];
}
//End UIPickerView setup.


-(void)viewWillAppear:(BOOL)animated
{
    //Set up Nav Controller styling.
    [self.navigationItem setTitle:@"MultiSearch"];
    [self.navigationController.navigationBar setBarStyle:UIBarStyleBlack];
    [self.view setBackgroundColor:[UIColor darkGrayColor]];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)switchToWebBrowserView:(id)sender
{
    self.webBrowserViewController = [[WebBrowserViewController alloc] initWithNibName:@"WebBrowserViewController" bundle:nil];
    webBrowserViewController.address1 = address1;
    webBrowserViewController.address2 = address2;
    [self.navigationController pushViewController:self.webBrowserViewController animated:YES];
    [self.webBrowserViewController setTitle:unfixedTerm];
}


//Takes in the search term from the user and runs the search.
-(IBAction)getSearchTermAndRun:(id)sender
{
    unfixedTerm = [sender text];
    [sender resignFirstResponder];
    [self fixTerm];
    [self setAddress];
    [self switchToWebBrowserView:nil];
}


//Formats the user search term to be compatible with the url.
-(void)fixTerm
{
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@" " options:NSRegularExpressionCaseInsensitive error:NULL];
    fixedTerm = [regex stringByReplacingMatchesInString:unfixedTerm options:0 range:NSMakeRange(0, [unfixedTerm length]) withTemplate:@"+"];
}


//Combines search term with the base url.
-(void)setAddress
{
    NSString *selection1 = [column objectAtIndex:[pickerView selectedRowInComponent:0]];
    NSString *selection2 = [column objectAtIndex:[pickerView selectedRowInComponent:1]];
    NSString *base1 = [self returnBase:selection1];
    NSString *base2 = [self returnBase:selection2];
    address1 = [base1 stringByAppendingString:fixedTerm];
    address2 = [base2 stringByAppendingString:fixedTerm];
}


//Returns URL base based on user search engine choice, selected via pickerview.
-(NSString *)returnBase:(NSString *) selection
{
    if (selection == [column objectAtIndex:0])
    {
        return @"http://google.com/search?q=";
    }
    else if (selection == [column objectAtIndex:1])
    {
        return @"http://search.yahoo.com/search?q=";
    }
    else if (selection == [column objectAtIndex:2])
    {
        return @"http://bing.com/search?q=";
    }
    else if (selection == [column objectAtIndex:3])
    {
        return @"http://ask.com/web?q=";
    }
    else if (selection == [column objectAtIndex:4])
    {
        return @"http://search.aol.com/aol/search?q=";
    }
    else if (selection == [column objectAtIndex:5])
    {
        return @"http://dogpile.com/search/web?q=";
    }
    else
    {
        return @"http://duckduckgo.com/?q=";
    }
}

@end
