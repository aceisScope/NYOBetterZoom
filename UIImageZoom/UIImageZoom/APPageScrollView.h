//
//  APPageScrollView.h
//  BonaFilm
//
//  Created by Xingzhi Cheng on 11/17/11.
//  Copyright (c) 2011 NUS. All rights reserved.
//

typedef enum 
{
    RIGHT,LEFT,UP,DOWN
}DIRECTION ;

@protocol APPageScrollViewDelegate;

@interface APPageScrollView : UIView <UIScrollViewDelegate> {
    UIView * _pageView[3];
    int numberOfPages;
}
@property (nonatomic, retain) UIScrollView * contentView;
@property (nonatomic, readwrite) int currentPageNum;
@property (nonatomic, assign) id<APPageScrollViewDelegate> delegate;
@property (nonatomic, assign) DIRECTION scrollDirection;

- (void) forward;
- (void) backward;

// subclass the following functions if needed, e.g. with a two dimensional image array;
- (UIView*) pageView;       // _pageView 初始化
- (void) showPageAtIndex:(int)index;                // 调用最初的显示
- (void) showPageAtIndex:(int)index animatedFromRect:(CGRect)rect;    
                                                    // 调用最初的显示, 有动画效果
- (void) reloadDataForPageAtLocation:(int)location; // 重载 _pageView 的显示
- (int)  numberOfPages;                             // 总共多少页
- (void) willDisplayPageAtIndex:(int)index;         // 提供页面切换的接口
- (void) willDisplayPageAtIndex:(int)index withDirection:(int)direction;         // 提供页面切换的接口

@end
