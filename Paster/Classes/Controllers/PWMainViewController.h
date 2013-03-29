//
//  MainViewController.h
//  Paster
//
//  Created by tzzzoz on 13-3-14.
//  Copyright (c) 2013年 Wuxiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootViewController.h"
#import "PWThemeFactory.h"
#import "PWPasterFactory.h"

@interface PWMainViewController : UIViewController<UIScrollViewDelegate>
{
    //视图对象
    UIScrollView *themeScrollView;
    UIPageControl *pageControl;
    NSMutableArray *themeButtonArray;
    
    
    //模型对象
    PWThemeFactory *themeFactory;
}

@property (nonatomic, strong) UIScrollView *themeScrollView;
@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, strong) NSMutableArray *themeButtonArray;

@property (nonatomic, strong) PWThemeFactory *themeFactory;
@property (nonatomic, strong) PWTheme *selectedTheme;


-(void)tapThemeButton:(UIButton*)button;
@end
