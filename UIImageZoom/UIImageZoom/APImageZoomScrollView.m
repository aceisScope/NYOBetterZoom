//
//  APImageZoomScrollView.m
//  UIImageZoom
//
//  Created by B.H.Liu appublisher on 12-2-3.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "APImageZoomScrollView.h"
#import "NYOBetterZoomUIScrollView.h"

@implementation APImageZoomScrollView

@synthesize imageList = _imageList;

- (void) showPageAtIndex:(int)index withImageArray:(NSArray*)imageArray
{
    self.imageList = imageArray;
    
    self.currentPageNum = 0;
    numberOfPages = [imageArray count];
    
    [super showPageAtIndex:index];
}

- (UIView*) pageView  
{
    NYOBetterZoomUIScrollView * imageScrollView = [[NYOBetterZoomUIScrollView alloc] initWithFrame:self.bounds];
	[imageScrollView setBackgroundColor:[UIColor blackColor]];
	[imageScrollView setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
	[imageScrollView setShowsVerticalScrollIndicator:NO];
	[imageScrollView setShowsHorizontalScrollIndicator:NO];
	[imageScrollView setBouncesZoom:YES];
	[imageScrollView setDelegate:self];
    
    return [imageScrollView autorelease];
}

- (void) reloadDataForPageAtLocation:(int) location   // 重载 _pageView 的显示
{
    int index = self.currentPageNum+location-1;    
    if (index < 0 || index >= [self numberOfPages]) return;
    
    NSString * imageName = [self.imageList objectAtIndex:index];
    UIImageView* imageView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]] autorelease];
    
    [((NYOBetterZoomUIScrollView *)_pageView[location]) setContentSize:imageView.frame.size];
    [((NYOBetterZoomUIScrollView *)_pageView[location]) setChildView:imageView];
	[((NYOBetterZoomUIScrollView *)_pageView[location]) setMaximumZoomScale:2.0];
	[((NYOBetterZoomUIScrollView *)_pageView[location]) setMinimumZoomForCurrentFrame];
	[((NYOBetterZoomUIScrollView *)_pageView[location]) setZoomScale:((NYOBetterZoomUIScrollView *)_pageView[location]).minimumZoomScale animated:NO];
    
}

- (int)  numberOfPages                             // 总共多少页
{
    return  numberOfPages;
}

- (void) willDisplayPageAtIndex:(int)index withDirection:(int)direction        // 提供页面切换的接口
{
    /////把翻过的前一页的图片恢复为minimunzoomscale,此处index是绝对页码，需要转成PRE 和 NEXT 的相对页码
    if (direction == 1 && index >= 1) 
    {
        [((NYOBetterZoomUIScrollView *)_pageView[0]) setZoomScale:((NYOBetterZoomUIScrollView *)_pageView[0]).minimumZoomScale animated:YES];
    }
    else if (direction == 0 && index <numberOfPages) 
    {
        [((NYOBetterZoomUIScrollView *)_pageView[2]) setZoomScale:((NYOBetterZoomUIScrollView *)_pageView[2]).minimumZoomScale animated:YES];
    }
    [super willDisplayPageAtIndex:index];
}

#pragma mark-
#pragma markl- UIScrollViewDelegate for NYOBetterZoomUIScrollView

- (UIView *)viewForZoomingInScrollView:(NYOBetterZoomUIScrollView *)aScrollView 
{
	return [aScrollView childView];
}

- (void)scrollViewDidEndZooming:(NYOBetterZoomUIScrollView *)scrollView withView:(UIView *)view atScale:(float)scale 
{
#ifdef DEBUG
	UIView *theView = [scrollView childView];
	NSLog(@"view frame: %@", NSStringFromCGRect(theView.frame));
	NSLog(@"view bounds: %@", NSStringFromCGRect(theView.bounds));
#endif
}



@end
