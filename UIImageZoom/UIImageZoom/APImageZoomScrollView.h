//
//  APImageZoomScrollView.h
//  UIImageZoom
//
//  Created by B.H.Liu appublisher on 12-2-3.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APPageScrollView.h"

@interface APImageZoomScrollView : APPageScrollView<UIScrollViewDelegate>

@property(nonatomic, retain) NSArray * imageList;

- (void) showPageAtIndex:(int)index withImageArray:(NSArray*)imageArray;

@end
