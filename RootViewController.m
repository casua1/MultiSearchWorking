//
//  RootViewController.m
//  MultiSearch
//
//  Created by iD Student on 7/3/13.
//  Copyright (c) 2013 Phil. All rights reserved.
//

#import "RootViewController.h"
#import "MyViewController.h"


@interface RootViewController ()

@property (nonatomic, strong) IBOutlet UIScrollView *scrollView;
@property (nonatomic, strong) IBOutlet UIPageControl *pageControl;
@property (nonatomic, strong) NSMutableArray *viewControllers;

@end


@implementation RootViewController

@synthesize address1, address2;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
//  Fill array with placeholders.
    NSMutableArray *controllers = [[NSMutableArray alloc] init];
    NSUInteger numberPages = 2;
    for (NSUInteger i = 0; i < numberPages; i++)
    {
		[controllers addObject:[NSNull null]];
    }
    self.viewControllers = controllers;
    
//  Pages are as wide as the scrollView itself.
    self.scrollView.pagingEnabled = YES;
    self.scrollView.contentSize = CGSizeMake(CGRectGetWidth(self.scrollView.frame) * numberPages, CGRectGetHeight(self.scrollView.frame));
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.scrollsToTop = NO;
    self.scrollView.delegate = self;
    
    self.pageControl.numberOfPages = numberPages;
    self.pageControl.currentPage = 0;
    
//  Preload Pages.
    [self loadScrollViewWithPage:0];
    [self loadScrollViewWithPage:1];
}


- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
//  Remove all the subviews from the scrollView.
    for (UIView *view in self.scrollView.subviews)
        [view removeFromSuperview];
    
    NSUInteger numPages = 2;
    
//  Adjust the contentSize (larger or smaller) depending on the orientation
    self.scrollView.contentSize = CGSizeMake(CGRectGetWidth(self.scrollView.frame) * numPages, CGRectGetHeight(self.scrollView.frame));
    
//  Clear out and reload pages.
    self.viewControllers = nil;
    NSMutableArray *controllers = [[NSMutableArray alloc] init];
    for (NSUInteger i = 0; i < numPages; i++)
    {
		[controllers addObject:[NSNull null]];
    }
    self.viewControllers = controllers;
    
    [self loadScrollViewWithPage:self.pageControl.currentPage - 1];
    [self loadScrollViewWithPage:self.pageControl.currentPage];
    [self loadScrollViewWithPage:self.pageControl.currentPage + 1];
    [self gotoPage:NO];
}


- (void)loadScrollViewWithPage:(NSUInteger)page
{
    if (page >= 2)
        return;
    
//  Replace placeholder if necessary.
    MyViewController *controller = [self.viewControllers objectAtIndex:page];
    if ((NSNull *)controller == [NSNull null])
    {
        controller = [[MyViewController alloc] initWithPageNumber:page];
        switch (page) {
            case 0:
                controller.address = address1;
                break;
                
            case 1:
                controller.address = address2;
                break;
        }
        [self.viewControllers replaceObjectAtIndex:page withObject:controller];
    }
    
//  Add the controller's view to the scroll view.
    if (controller.view.superview == nil)
    {
        CGRect frame = self.scrollView.frame;
        frame.origin.x = CGRectGetWidth(frame) * page;
        frame.origin.y = 0;
        controller.view.frame = frame;
        
        [self addChildViewController:controller];
        [self.scrollView addSubview:controller.view];
        [controller didMoveToParentViewController:self];
    }
}


//Resets the boolean used when scrolls originate from the UIPageControl at the end of scroll animation.
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
//  Switch the indicator when more than 50% of the previous/next page is visible.
    CGFloat pageWidth = CGRectGetWidth(self.scrollView.frame);
    NSUInteger page = floor((self.scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    self.pageControl.currentPage = page;
    
//  Load the visible page and the page on either side of it (to avoid flashes when the user starts scrolling).
    [self loadScrollViewWithPage:page - 1];
    [self loadScrollViewWithPage:page];
    [self loadScrollViewWithPage:page + 1];
}


- (void)gotoPage:(BOOL)animated
{
    NSInteger page = self.pageControl.currentPage;
    
//  Load the visible page and the page on either side of it (to avoid flashes when the user starts scrolling).
    [self loadScrollViewWithPage:page - 1];
    [self loadScrollViewWithPage:page];
    [self loadScrollViewWithPage:page + 1];
    
//  Update the scrollView to the appropriate page.
    CGRect bounds = self.scrollView.bounds;
    bounds.origin.x = CGRectGetWidth(bounds) * page;
    bounds.origin.y = 0;
    [self.scrollView scrollRectToVisible:bounds animated:animated];
}

- (IBAction)changePage:(id)sender
{
    [self gotoPage:YES];
}

@end

