//
//  RootViewController.h
//  Paster
//
//  Created by tzzzoz on 13-3-19.
//  Copyright (c) 2013年 Wuxiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PWMainViewController.h"
#import "PWWonderlandViewController.h"
#import "PWPasterEditViewController.h"
#import "PWGeoPasterEditViewController.h"

@class PWMainViewController;
@class PWWonderlandViewController;
@class PWPasterEditViewController;
@class PWAboutViewController;

@interface RootViewController : UIViewController
{
    NSMutableArray *viewControllersStack;
    UIViewController *currentViewController;
    UIViewController *nextViewController;
}


+(RootViewController *)sharedRootViewController;

@property (retain, nonatomic) NSMutableArray *viewControllersStack;
@property (retain, nonatomic) UIViewController *currentViewController;
@property (retain, nonatomic) UIViewController *nextViewController;


-(void)pushViewController:(UIViewController*) viewController;
-(void)popViewController;
-(void)display;

@end
