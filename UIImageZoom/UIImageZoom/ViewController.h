//
//  ViewController.h
//  UIImageZoom
//
//  Created by B.H.Liu appublisher on 12-2-2.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NYOBetterZoomUIScrollView.h"

@interface ViewController : UIViewController <UIScrollViewDelegate>
{

}

@property (nonatomic, retain) NYOBetterZoomUIScrollView *imageScrollView;

@end
