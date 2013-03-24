//
//  AppDelegate.h
//  Paster
//
//  Created by tzzzoz on 13-3-6.
//  Copyright (c) 2013年 Wuxiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    UIWindow *window;
    RootViewController *rootViewController;
}
@property (strong, nonatomic) IBOutlet UIWindow *window;
@property (strong, nonatomic) IBOutlet RootViewController *rootViewController;

@end
