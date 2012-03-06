//
//  ViewController.m
//  UIImageZoom
//
//  Created by B.H.Liu appublisher on 12-2-2.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "APImageZoomScrollView.h"


@implementation ViewController

@synthesize imageScrollView = _imageScrollView;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}


#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    // Set up our custom ScrollView
    UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(10, 10, 200, 40);
    [button setTitle:@"Press to Toggle ZoomView" forState:UIControlStateNormal];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(toggleZoomView:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)toggleZoomView:(UIView*)view
{
    NSArray *array = [NSArray arrayWithObjects:@"scene1.jpg",@"scene2.jpg",@"scene3.jpg",@"weibo.jpg", nil];
    
    APImageZoomScrollView *imageZoomScrollView = [[[APImageZoomScrollView alloc]initWithFrame:self.view.bounds] autorelease];
    imageZoomScrollView.autoresizingMask =  UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:imageZoomScrollView];
    [imageZoomScrollView showPageAtIndex:0 withImageArray:array];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


@end
