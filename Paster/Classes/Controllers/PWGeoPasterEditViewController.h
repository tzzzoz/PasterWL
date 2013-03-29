//
//  PWGeoPasterEditViewController.h
//  Paster
//
//  Created by tzzzoz on 13-3-25.
//  Copyright (c) 2013年 Wuxiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootViewController.h"

@interface PWGeoPasterEditViewController : UIViewController
{
    //视图对象
    IBOutlet UIButton *zoomOutButton;
    //模型对象
    PWGeoPaster *selectedGeoPaster;
    PWGeoPaster *selectedColorGeoPaster;
}

@property (nonatomic, strong) IBOutlet UIButton *zoomOutButton;

@property (nonatomic, strong) PWGeoPaster *selectedGeoPaster;
@property (nonatomic, strong) PWGeoPaster *selectedColorGeoPaster;

@end
